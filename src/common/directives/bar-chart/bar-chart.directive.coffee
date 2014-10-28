require './bar-chart.directive.tpl.html'

directive = () ->
  return {
    restrict: 'E'
    templateUrl: '/directives/bar-chart/bar-chart.directive.tpl.html'
    scope: 
      percent: '=percent'
  }

module.exports = directive
