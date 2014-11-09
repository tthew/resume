### VENDOR ###
# require 'bower/angular/angular.js'
require 'bower/foundation/css/normalize.css'
require 'bower/foundation/css/foundation.css'
require 'bower/font-awesome/scss/font-awesome.scss'
require 'bower/angular-foundation/mm-foundation'
require 'bower/angular-foundation/mm-foundation-tpls.js'
require 'bower/angular-ui-router/release/angular-ui-router'
require 'bower/angular-sanitize/angular-sanitize.js'
require 'bower/angular-animate/angular-animate.js'
$ = require 'jquery'

### APPLICATION ###

# Common
require '../config/_default.js'
require './common/data/contentful.coffee'
# Modules
require './modules/resume/index.coffee'
# SCSS
require './scss/settings.scss'
require './scss/app.scss'

# Init App
app = angular.module 'tthew-resume', [
  # Vendor
  'ngSanitize'
  'dataservice.contentful'
  'ui.router'
  'ngAnimate'
  'mm.foundation'
  # App
  'tthew.config'
  'tthew.resume'
] 

# App config
app.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'

module.exports = app
