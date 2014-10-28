app = angular.module 'tthew.resume.skills.list.directive', []

directive = () ->
  return {
    restrict: 'E'
    templateUrl: '/resume/skills/resume.skills.list.directive.tpl.html'
    scope: 
      skills: '=skills'      
  }

app.directive 'skillsList', directive
