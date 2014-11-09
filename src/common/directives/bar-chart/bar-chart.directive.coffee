$ = require 'jquery'
require './bar-chart.directive.tpl.html'

directive = () ->
  return {
    restrict: 'E'
    templateUrl: '/directives/bar-chart/bar-chart.directive.tpl.html'
    scope: 
      percent: '=percent'
    link: (scope, element) ->
      el = $ '.bar', element
      el.css 
        'width': scope.percent + '%'
  }

module.exports = directive
