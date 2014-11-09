require './resume.projects.list.directive.tpl.html'
module.exports = () ->
  return {
    restrict: 'E'
    templateUrl: '/resume/projects/resume.projects.list.directive.tpl.html'
    scope:
      projects: '=projects'
  }

