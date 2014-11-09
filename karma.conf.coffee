# Karma configuration
# Generated on Mon Jun 09 2014 01:16:57 GMT-0700 (PDT)
# require 'karma-mocha'
webpack = require 'webpack'
fullWebpackConfig = require './webpack.config.coffee'

webpackConfig =
  module: fullWebpackConfig.module
  resolve: fullWebpackConfig.resolve
  plugins: [ 
    new webpack.ResolverPlugin [
      new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin "bower.json", ["main"]
    ], ["normal", "loader"]

    # disable dynamic requires
    new webpack.ContextReplacementPlugin(/.*$/, /a^/)

    new webpack.ProvidePlugin 
      'angular': 'exports?window.angular!bower/angular'
    # new ExtractTextPlugin "[name].css",
    #   allChunks: true
    new webpack.ProvidePlugin 
     "contentful": "contentful"
  ]
  devtool: 'eval'
  cache: true

module.exports = (config) ->
  config.set

    # base path that will be used to resolve all patterns (eg. files, exclude)
    basePath: __dirname

    # frameworks to use
    # available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: ['mocha', 'chai']

    # list of files / patterns to load in the browser
    files: [
      'bower_components/angular/angular.js'
      'bower_components/angular-mocks/angular-mocks.js'
      'tests/**/*.spec.js'
    ]

    # list of files to exclude
    exclude: [

    ]

    plugins: [
      require 'karma-webpack'
      require 'karma-mocha'
      require 'karma-chai'
      require 'karma-firefox-launcher'
    ]

    # preprocess matching files before serving them to the browser
    # available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors: {
      # 'src/**/*.coffee': ['webpack'],
      'tests/**/*.spec.js': ['webpack']
    }

    webpack: webpackConfig
    # webpack: {}

    # webpackServer:
      # noInfo: # true


    # test results reporter to use
    # possible values: 'dots', 'progress'
    # available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: ['progress']

    # web server port
    port: 9876

    # enable / disable colors in the output (reporters and logs)
    colors: true

    # level of logging
    # possible values:
    # - config.LOG_DISABLE
    # - config.LOG_ERROR
    # - config.LOG_WARN
    # - config.LOG_INFO
    # - config.LOG_DEBUG
    logLevel: config.LOG_INFO

    # enable / disable watching file and executing tests whenever any file changes
    autoWatch: true

    # start these browsers
    # available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: ['Firefox']

    # Continuous Integration mode
    # if true, Karma captures browsers, runs the tests and exits
    singleRun: false


