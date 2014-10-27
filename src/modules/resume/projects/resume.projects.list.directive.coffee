app = angular.module 'tthew.resume.projects.list.directive', []

directive = () ->
  return {
    restrict: 'E'
    templateUrl: '/resume/projects/resume.projects.list.directive.tpl.html'
    scope: 
      projects: '=projects'      
  }

app.directive 'projectsList', directive
