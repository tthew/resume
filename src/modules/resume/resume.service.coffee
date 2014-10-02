require 'common/data/contentful.coffee'
app = angular.module 'resume.service', [
  'dataservice.contentful'
]

app.factory 'resumeService', (contentfulClient, config) ->

  _getType = (contentType) ->
    contentfulClient.entries {
      'content_type': contentType
    }

  getExperience = () ->
    _getType config.contentful.spaces.CV.contentTypes.experience.id
              
  getSkills = () ->
    _getType config.contentful.spaces.CV.contentTypes.skill.id

  getProjects = () ->
    _getType config.contentful.spaces.CV.contentTypes.project.id

  getEducation = () ->
    _getType config.contentful.spaces.CV.contentTypes.education.id

  getCoverLetter = () ->
    contentfulClient.entries 
      'content_type': config.contentful.spaces.CV.contentTypes.page.id
      'sys.id': '2xv9FxWuZSA4o2YMayy6AM'
    .then (entries) ->
      entries[0]

  service = {
    getExperience: getExperience
    getSkills: getSkills
    getProjects: getProjects
    getEducation: getEducation
    getCoverLetter: getCoverLetter
  }

  return service


  


  
