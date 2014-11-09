barChartDirective = require './bar-chart.directive.coffee'

angular.module 'tthew.bar-chart.directive', []
  .directive 'barChart', barChartDirective 

module.exports = angular.module 'tthew.bar-chart', [
  'tthew.bar-chart.directive'
]

