### VENDOR ###
require 'bower/foundation/css/normalize.css'
# require 'bower/contentful/dist/contentful.js'
# require 'bower/foundation/scss/foundation/_functions.scss'
require 'bower/foundation/css/foundation.css'
require 'bower/font-awesome/scss/font-awesome.scss'
require 'bower/angular-foundation/mm-foundation'
require 'bower/angular-foundation/mm-foundation-tpls.js'
require 'bower/angular-ui-router/release/angular-ui-router'
# require 'bower/angular-ui-select/dist/select.js'
# require 'bower/angular-ui-select/dist/select.css'
require 'bower/angular-sanitize/angular-sanitize.js'
require 'bower/angular-animate/angular-animate.js'
require 'bower/angular-bindonce/bindonce.js'
$ = require 'jquery'

### APPLICATION ###

# Config
require './common/data/contentful.coffee'
# Modules
require './modules/resume/index.coffee'

# SCSS

require '../config/_default.js'
require './scss/settings.scss'
require './scss/app.scss'

# Init App
app = angular.module 'mr-app', [
  # Vendor
  'ngSanitize'
  'dataservice.contentful'
  # 'ui.select'
  'ui.router'
  'pasvaz.bindonce'
  'ngAnimate'
  'mm.foundation'
  # App
  'hm.config'
  'resume'
] 

# App config
app.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'

module.exports = app
