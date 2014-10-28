require './resume.service.coffee'
require './resume.controller.coffee'
require './resume.tpl.html'
require './resume.scss'

require './skills'
require './education'
require './experience'

app = angular.module 'tthew.resume', [
  'tthew.resume.service'
  'tthew.resume.controller'
  'tthew.resume.skills'
  'tthew.resume.education'
  'tthew.resume.experience'
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

