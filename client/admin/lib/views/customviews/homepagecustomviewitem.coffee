kd = require 'kd'
KDCustomHTMLView = kd.CustomHTMLView
KDModalView = kd.ModalView
CustomViewItem = require './customviewitem'
KodingSwitch = require 'app/commonviews/kodingswitch'
__t          = require('i18next').t


module.exports = class HomePageCustomViewItem extends CustomViewItem

  creteElements: ->
    super

    @previewToggle  = new KodingSwitch
      cssClass      : 'dark preview-toggle'
      defaultValue  : @getData().isPreview
      settingType   : 'preview'
      callback      : =>
        @confirmAction @previewToggle, =>
          @updateState 'isPreview'

    @activateToggle = new KodingSwitch
      cssClass      : 'dark publish'
      defaultValue  : @getData().isActive
      settingType   : 'activate'
      callback      : =>
        @confirmAction @activateToggle, =>
          @updateState 'isActive'

    @previewToggle.addSubView new KDCustomHTMLView
      tagName       : 'span'
      partial       : __t 'Preview'

    @activateToggle.addSubView new KDCustomHTMLView
      tagName       : 'span'
      partial       : __t 'Publish'

  confirmAction: (button, callback = kd.noop) ->
    isActivated  = button.getValue()
    isPreview    = button.getOption('settingType') is 'preview'

    if isActivated then button.setOff no else button.setOn no # don't update state, wait for confirmation

    content =
      if isPreview
        if isActivated then messages.enablePreview    else messages.cancelPreview
      else
        if isActivated then messages.enablePublishing else messages.cancelPublising

    modal          = new KDModalView
      title        : __t 'Are you sure?'
      content      : "<p>#{__t "HomePageCustomView First content", {content: content}}</p>"
      overlay      : yes
      buttons      :
        Delete     :
          title    : __t 'Confirm'
          cssClass : 'solid green medium'
          callback : ->
            callback()
            modal.destroy()
        Cancel     :
          title    : __t 'Cancel'
          cssClass : 'solid light-gray medium'
          callback : -> modal.destroy()

  updateState: (key) ->
    delegate = @getDelegate()
    data     = @getData()

    for customView in delegate.customViews
      oldActive = customView  if customView.getData()[key] is yes

    toggleState = ->
      changeSet      = {}
      changeSet[key] = not data[key]

      data.update changeSet, (err, res) ->
        return kd.warn err  if err
        delegate.reloadViews()

    if oldActive
      changeSet      = {}
      changeSet[key] = no

      oldActive.getData().update changeSet, (err, res) ->
        return kd.warn err  if err
        toggleState()
    else
      toggleState()

  pistachio: ->
    data = @getData()
    """
      <p>#{data.name}</p>
      {{> @previewToggle}}
      {{> @activateToggle}}
      <div class="button-container">
        {{> @deleteButton}}
        {{> @editButton}}
      </div>
    """

  messages =
    cancelPreview   : """
      #{__t "You are about to cancel preview mode for this item.
      If you don't have any preview enabled item, be sure you removed the preview cookie by pressing the CANCEL PREVIEW button."}
    """
    enablePreview   : """
      #{__t "You are about to preview this item.
            Be sure, you already clicked the PREVIEW button to set the cookie.<br /><br />
            Incognito window won't work because it won't have a preview cookie unless you set one.<br /><br />
            Known issue: If you have a cookie, you will only see the selected preview item.
            Currently we won't show you already published item. Sorry for that :( "}
    """
    cancelPublising : '''
      #{__t "Are you sure you want to cancel publishing this item?"}
    '''
    enablePublishing: '''
      #{__t "Are you sure you want to publish this item?
            It will be visible to ALL Koding members!"}
    '''
