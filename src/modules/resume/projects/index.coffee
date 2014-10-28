require './resume.projects.list.directive.coffee'
require './resume.projects.list.directive.tpl.html'
require 'common/directives/bar-chart'

app = angular.module 'tthew.resume.projects', [
  'tthew.resume.projects.list.directive'
  'tthew.bar-chart'
]

