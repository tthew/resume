contentful = require 'contentful'
require 'bower/ng-contentful/ng-contentful.js'

app = angular.module 'dataservice.contentful', [
  'ng-contentful'
  'hm.config'
]

app.config (contentfulClientProvider, config) -> 
  contentfulClientProvider.setSpaceId config.contentful.spaces.CV.id
  contentfulClientProvider.setAccessToken config.contentful.spaces.CV.keys.production
