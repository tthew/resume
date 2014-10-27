require 'bower/angular-markdown-filter/markdown.js'
moment = require 'moment'

app = angular.module 'resume.controller', ['markdown']
controller = (experience, skills, coverLetter, education) ->
  @experience = experience
  @skills = skills
  @education = education
  @coverLetter = coverLetter

  console.log @coverLetter
  
  @getDuration = (start, end) ->
    if end
      moment.duration(moment(end).diff(moment(start))).humanize()
    
  return

app.controller 'ResumeCtrl', controller

