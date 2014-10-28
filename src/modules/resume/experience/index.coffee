require './resume.experience.list.directive.coffee'
require './resume.experience.list.directive.tpl.html'
require 'modules/resume/projects'

app = angular.module 'tthew.resume.experience', [
  'tthew.resume.experience.list.directive',
  'tthew.resume.projects'
]

