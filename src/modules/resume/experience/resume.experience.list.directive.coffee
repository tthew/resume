app = angular.module 'tthew.resume.experience.list.directive', []
moment = require 'moment'

directive = () ->
  return {
    restrict: 'E'
    templateUrl: '/resume/experience/resume.experience.list.directive.tpl.html'
    scope:
      experience: '=experience'
    link: (scope, element, attribute) ->
      scope.getDuration = (start, end) ->
        if end
          duration = moment.duration(moment(end).diff(moment(start))).humanize()
          duration
      
  }

app.directive 'experienceList', directive
