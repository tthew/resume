directive = require './resume.education.list.directive.coffee'

angular.module 'tthew.resume.education.list.directive', []
  .directive 'educationList', directive

module.exports = angular.module 'tthew.resume.education', [
  'tthew.resume.education.list.directive'
]
