require 'modules/resume/projects'
directive = require './resume.experience.list.directive.coffee'

angular.module 'tthew.resume.experience.list.directive', []
  .directive 'experienceList', directive

module.exports = angular.module 'tthew.resume.experience', [
  'tthew.resume.experience.list.directive',
  'tthew.resume.projects'
]
