require 'bower/angular-markdown-filter/markdown.js'

app = angular.module 'tthew.resume.controller', ['markdown']
controller = (experience, skills, coverLetter, education) ->
  @experience = experience
  @skills = skills
  @education = education
  @coverLetter = coverLetter
    
  return

app.controller 'ResumeCtrl', controller

