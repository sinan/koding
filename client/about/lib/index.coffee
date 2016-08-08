kd = require 'kd'
KDViewController = kd.ViewController
AboutAppView = require './aboutappview'
__t = require('i18next').t


module.exports = class AboutAppController extends KDViewController

  @options =
    name  : __t 'About'
    route : '/:name?/About'


  constructor: (options = {}, data) ->

    options.view    = new AboutAppView
      cssClass      : 'content-page about'

    super options, data
