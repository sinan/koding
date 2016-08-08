kd = require 'kd'
KDButtonView = kd.ButtonView
KDModalView = kd.ModalView
JView = require 'app/jview'
__t   = require('i18next').t


module.exports = class CustomViewItem extends JView

  constructor: (options = {}, data) ->

    options.cssClass = 'custom-view-item'

    super options, data

    @creteElements()

  creteElements: ->
    @deleteButton = new KDButtonView
      cssClass    : 'delete'
      iconOnly    : yes
      callback    : =>
        @notify => @delete()

    @editButton   = new KDButtonView
      cssClass    : 'edit'
      iconOnly    : yes
      callback    : @bound 'edit'

  notify: (callback = kd.noop) ->
    modal          = new KDModalView
      title        : __t 'Are you sure?'
      content      : __t 'Are you sure you want to delete the item. This cannot be undone.'
      overlay      : yes
      buttons      :
        Delete     :
          title    : __t 'Delete'
          cssClass : 'solid red medium'
          callback : ->
            callback()
            modal.destroy()
        Cancel     :
          title    : __t 'Cancel'
          cssClass : 'solid light-gray medium'
          callback : -> modal.destroy()

  edit: ->
    @getDelegate().emit 'ViewEditRequested', @getData()

  delete: ->
    viewData = @getData()
    viewData.remove (err, res) =>
      return kd.warn err  if err
      @getDelegate().emit 'ViewDeleted', viewData
      @destroy()

  pistachio: ->
    data = @getData()
    """
      <p>#{data.name}</p>
      <div class="button-container">
        {{> @deleteButton}}
        {{> @editButton}}
      </div>
    """
