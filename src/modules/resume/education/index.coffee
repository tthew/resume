require './resume.education.list.directive.coffee'
require './resume.education.list.directive.tpl.html'

app = angular.module 'tthew.resume.education', [
  'tthew.resume.education.list.directive'
]

