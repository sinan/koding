class MainViewController extends KDViewController

  logViewByElement = (el) ->

    for id, view of KD.instances when view.getElement?
      if el is view.getElement()
        log view
        break

    logViewByElement el.parentNode  unless el.parentNode is document.body


  constructor:->

    super

    {repeat, killRepeat} = KD.utils
    mainView             = @getView()
    appManager           = KD.singleton 'appManager'
    windowController     = KD.singleton 'windowController'
    display              = KD.singleton 'display'
    mainController       = KD.singleton 'mainController'

    mainView.on 'MainTabPaneShown', (pane) =>
      @mainTabPaneChanged mainView, pane

    appManager.on 'AppIsBeingShown', (controller) =>
      @setBodyClass KD.utils.slugify controller.getOption 'name'

      # todo:
      # remove this part once mmvp becomes mvp - SY
      {name} = controller.getOptions()
      switch name
        when 'IDE'
          mainView.activitySidebar?.deselectAllItems()
          mainView.activitySidebar?.activityLink?.unsetClass 'selected'
        when 'Activity'
          mainView.activitySidebar?.activityLink?.setClass 'selected'
          mainView.activitySidebar?.machineTree?.deselectAllNodes()



    display?.on 'ContentDisplayWantsToBeShown', do =>
      type = null
      (view) => @setBodyClass type  if type = view.getOption 'type'

    windowController.on 'ScrollHappened', @bound 'handleScroll'

    if KD.config?.environment isnt 'production'
      window.addEventListener 'click', (event) =>
        if event.metaKey and event.altKey
          logViewByElement event.target
      , yes


  loadView:(mainView)->

    mainView.ready =>

      {body} = document
      if KD.checkFlag 'super-admin'
      then KDView.setElementClass body, 'add', 'super'
      else KDView.setElementClass body, 'remove', 'super'


  handleScroll: do ->

    threshold     = 50
    lastScroll    = 0
    currentHeight = 0

    KD.utils.throttle (event) ->

      el = document.body
      {scrollHeight, scrollTop} = el

      return  if scrollHeight <= window.innerHeight or scrollTop <= 0

      current = scrollTop + window.innerHeight
      if current > scrollHeight - threshold
        return if lastScroll > 0
        appManager    = KD.singleton 'appManager'
        appManager.getFrontApp()?.emit "LazyLoadThresholdReached"
        lastScroll    = current
        currentHeight = scrollHeight
      else if current < lastScroll then lastScroll = 0

      if scrollHeight isnt currentHeight then lastScroll = 0

    , 200


  setBodyClass: do ->

    previousClass = null

    (name)->

      {body} = document
      KDView.setElementClass body, 'remove', previousClass  if previousClass
      KDView.setElementClass body, 'add', name
      previousClass = name


  mainTabPaneChanged:(mainView, pane)->

    appManager      = KD.getSingleton 'appManager'
    app             = appManager.getFrontApp()
    {mainTabView}   = mainView
    warn 'set active nav item by route change, not by maintabpane change'

    # KD.singleton('display').emit "ContentDisplaysShouldBeHidden"
    # temp fix
    # until fixing the original issue w/ the dnd this should be kept here
    if pane
    then @setViewState pane.getOptions()
    else mainTabView.getActivePane().show()


  setViewState: (options = {}) ->

    {behavior, name} = options

    html     = document.documentElement
    mainView = @getView()

    fullSizeApps = ['Login', 'Pricing']
    appsWithSidebar = [
      'Activity', 'Members', 'content-display', 'Apps', 'Dashboard', 'Account'
      'Environments', 'Bugs'
    ]

    if (isApp = behavior is 'application') or (name in fullSizeApps)
    then KDView.setElementClass html, 'add', 'app'
    else KDView.setElementClass html, 'remove', 'app'

    if isApp or name in appsWithSidebar
    then mainView.setClass 'with-sidebar'
    else mainView.unsetClass 'with-sidebar'
