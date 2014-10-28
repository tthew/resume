require './resume.skills.list.directive.coffee'
require './resume.skills.list.directive.tpl.html'
require './skills.scss'
require 'common/directives/bar-chart'

app = angular.module 'tthew.resume.skills', [
  'tthew.resume.skills.list.directive'
  'tthew.bar-chart'
]

