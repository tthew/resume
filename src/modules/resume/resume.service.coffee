module.exports = (contentfulClient, config) ->
  _getType = (contentType) ->
    contentfulClient.entries {
      'content_type': contentType
    }

  getExperience = () ->
    _getType config.contentful.spaces.resume.contentTypes.experience.id
              
  getSkills = () ->
    _getType config.contentful.spaces.resume.contentTypes.skill.id

  getProjects = () ->
    _getType config.contentful.spaces.resume.contentTypes.project.id

  getEducation = () ->
    _getType config.contentful.spaces.resume.contentTypes.education.id

  getCoverLetter = () ->
    contentfulClient.entries 
      'content_type': config.contentful.spaces.resume.contentTypes.page.id
      'sys.id': config.contentful.spaces.resume.contentTypes.page.coverLetter.id
    .then (entries) ->
      entries[0]

  service = {
    getExperience: getExperience
    getSkills: getSkills
    getProjects: getProjects
    getEducation: getEducation
    getCoverLetter: getCoverLetter
  }
