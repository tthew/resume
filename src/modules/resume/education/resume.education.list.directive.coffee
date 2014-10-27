app = angular.module 'tthew.resume.education.list.directive', []

directive = () ->
  return {
    restrict: 'E'
    templateUrl: '/resume/education/resume.education.list.directive.tpl.html'
    scope: 
      education: '=education'      
  }

app.directive 'educationList', directive
