require 'bower/showdown/src/ng-showdown.js'
require 'common/data/contentful.coffee'

require './resume.tpl.html'
require './resume.scss'
require './skills'
require './education'
require './experience'

# Module Definition
service = require './resume.service.coffee'
controller = require './resume.controller.coffee'

angular.module 'tthew.resume.controller', []
  .controller 'ResumeCtrl', controller

angular.module 'tthew.resume.service', ['dataservice.contentful']
  .factory 'resumeService', service

app = angular.module 'tthew.resume', [
  'Showdown'
  'tthew.resume.service'
  'tthew.resume.controller'
  'tthew.resume.skills'
  'tthew.resume.education'
  'tthew.resume.experience'
]

# States
app.config ($stateProvider) ->
  $stateProvider.state 'resume',
    url: '/'
    templateUrl: '/modules/resume/resume.tpl.html'
    controller: 'ResumeCtrl'
    controllerAs: 'vm'
    resolve: 
      experience: (resumeService) ->
        resumeService.getExperience()
      skills: (resumeService) ->
        resumeService.getSkills()
      education: (resumeService) ->
        resumeService.getEducation()
      coverLetter: (resumeService) ->
        resumeService.getCoverLetter()
