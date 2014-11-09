require 'common/directives/bar-chart'
directive = require './resume.projects.list.directive.coffee'

angular.module 'tthew.resume.projects.list.directive', []
  .directive 'projectsList', directive

app = angular.module 'tthew.resume.projects', [
  'tthew.resume.projects.list.directive'
  'tthew.bar-chart'
]

