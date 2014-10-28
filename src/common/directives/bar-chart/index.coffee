directiveModule = angular.module 'tthew.bar-chart.directive', []
directiveModule.directive 'barChart', require './bar-chart.directive.coffee'

app = angular.module 'tthew.bar-chart', [
  'tthew.bar-chart.directive'
]

module.exports = app
