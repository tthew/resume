moment = require 'moment'
require './resume.experience.list.directive.tpl.html'

module.exports = () ->
  return {
    restrict: 'E'
    templateUrl: '/resume/experience/resume.experience.list.directive.tpl.html'
    scope:
      experience: '=experience'
    link: (scope, element, attribute) ->
      scope.getDuration = (start, end) ->
        if end
          moment.duration(moment(end).diff(moment(start))).humanize()
  }
