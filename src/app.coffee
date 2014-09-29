require 'bower/angular-ui-router/release/angular-ui-router'
require 'bower/pouchdb/dist/pouchdb-nightly'
require 'bower/angular-pouchdb/angular-pouchdb'
require './modules/notes/notes.service'

appCtrl = require './app.ctrl'

# Application
nts = angular.module 'nts', [
  'ui.router',
  'pouchdb.datastore',
  'notes.service'
] 

# App config
nts.config ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise '/'
    $stateProvider
      .state 'default', 
        url: '/'
        templateUrl: 'templates/default.html'
        controller: 'AppCtrl',
        controllerAs: 'vm'


# Controllers 
nts.controller 'AppCtrl', appCtrl

module.exports = nts
