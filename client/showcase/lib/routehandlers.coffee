kd = require 'kd'

module.exports = ShowcaseRouteHandlers =

  # /Showcase
  handleShowcaseIndex: ->

    openShowcase -> console.log 'hello'


openShowcase = (callback) ->
  {appManager, mainController} = kd.singletons
  mainController.ready -> appManager.open 'Showcase', callback
