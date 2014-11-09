require './resume.education.list.directive.tpl.html'

module.exports = () ->
  return {
    restrict: 'E'
    templateUrl: '/resume/education/resume.education.list.directive.tpl.html'
    scope:
      education: '=education'
  }
