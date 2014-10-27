require './bar-chart.directive.tpl.html'

app = angular.module 'tthew.bar-chart.directive', []

directive = () ->
  return {
    restrict: 'E'
    templateUrl: '/directives/bar-chart/bar-chart.directive.tpl.html'
    scope: 
      percent: '=percent'
  }

app.directive 'barChart', directive
