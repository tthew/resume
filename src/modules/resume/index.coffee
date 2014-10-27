require './resume.service.coffee'
require './resume.controller.coffee'
require './resume.tpl.html'
require './resume.scss'

app = angular.module 'resume', [
  'resume.service'
  'resume.controller'
]

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

