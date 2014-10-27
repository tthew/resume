contentful = require 'contentful'
require 'bower/ng-contentful/ng-contentful.js'

app = angular.module 'dataservice.contentful', [
  'ng-contentful'
  'tthew.config'
]

app.config (contentfulClientProvider, config) -> 
  contentfulClientProvider.setSpaceId config.contentful.spaces.resume.id
  contentfulClientProvider.setAccessToken config.contentful.spaces.resume.keys.production
