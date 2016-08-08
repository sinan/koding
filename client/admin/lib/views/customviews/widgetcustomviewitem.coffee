kd = require 'kd'
KDCustomHTMLView = kd.CustomHTMLView
KDSelectBox = kd.SelectBox
CustomViewItem = require './customviewitem'
__t            = require('i18next').t


module.exports = class WidgetCustomViewItem extends CustomViewItem

  creteElements: ->
    super

    selectOptions    = [ { title : __t 'Not Active', value : 'NOT_VISIBLE' } ]
    widgetController = kd.getSingleton 'widgetController'

    for key, widget of widgetController.getPlaceholders()
      selectOptions.push { title: widget.title, value: widget.key }

    data = @getData()

    @assignSelect   = new KDSelectBox
      preview       : __t 'Publish'
      cssClass      : 'assign solid green'
      selectOptions : selectOptions
      defaultValue  : data.isActive and data.viewInstance ? 'NOT_VISIBLE'
      callback      : (value) => @updateState value

    @previewSelect  = new KDSelectBox
      title         : __t 'Preview'
      cssClass      : 'solid green preview-select'
      selectOptions : selectOptions
      defaultValue  : data.isPreview and data.previewInstance ? 'NOT_VISIBLE'
      callback      : (value) => @updateState value, yes

    @previewLabel   = new KDCustomHTMLView
      tagName       : 'span'
      cssClass      : 'select-label'
      partial       : __t 'Preview'

    @assignLabel    = new KDCustomHTMLView
      tagName       : 'span'
      cssClass      : 'select-label assign'
      partial       : __t 'Publish'

  updateState: (value, previewRequest) ->
    delegate = @getDelegate()
    data     = @getData()

    stateKey = 'isActive'
    viewKey  = 'viewInstance'

    if previewRequest
      stateKey = 'isPreview'
      viewKey  = 'previewInstance'

    for customView in delegate.customViews
      if customView.getData()[viewKey] is value
        oldActive = customView

    toggleState = ->
      changeSet = {}
      changeSet[stateKey] = yes
      changeSet[viewKey]  = value

      data.update changeSet, (err, res) ->
        return kd.warn err  if err
        delegate.reloadViews()

    if oldActive
      changeSet = {}
      changeSet[viewKey]  = 'NOT_VISIBLE'
      changeSet[stateKey] = no

      oldActive.getData().update changeSet, (err, res) ->
        return kd.warn err  if err
        toggleState()
    else
      toggleState()

  pistachio: ->
    data = @getData()
    """
      <p>#{data.name}</p>
      {{> @previewSelect}}
      {{> @previewLabel}}
      {{> @assignSelect}}
      {{> @assignLabel}}
      <div class="button-container">
        {{> @deleteButton}}
        {{> @editButton}}
      </div>
    """
