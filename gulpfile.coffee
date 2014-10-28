# gulp plugins
gulp = require 'gulp'
changed = require 'gulp-changed'
gutil = require 'gulp-util'

# misc
spawn = require('child_process').spawn
argv = require('minimist')(process.argv.slice(2))

# webpack
webpack = require 'webpack'
WebpackDevServer = require 'webpack-dev-server'
webpackConfig = require './webpack.config'
ngAnnotatePlugin = require 'ng-annotate-webpack-plugin'

# Karma
# karma = require 'karma'.server
karma = require 'karma'
karmaServer = karma.server
# Config
gulpNgConfig = require 'gulp-ng-config'

# Connect
require 'local-tld'

if argv.production  # --production option
  webpackConfig.plugins = webpackConfig.plugins.concat new ngAnnotatePlugin(),
    new webpack.optimize.UglifyJsPlugin()
  webpackConfig.devtool = false
  webpackConfig.debug = false

ports =
  livereload: 35730

paths =
  other: [
    '!src/index.html'
    'src/images/**'
    'src/fonts/**'
    '!src/**/*.js'
    '!src/**/*.coffee'
    '!src/**/*.scss'
    '!src/**/*.tpl.html'
    
    # '.local-tld.json'
  ],
  distDir: './dist/'

prodConfig = Object.create webpackConfig
prodConfig.plugins = webpackConfig.plugins.concat(
    new webpack.DefinePlugin(
        'process-env': 
            'NODE_ENV': JSON.stringify('production')
    )
    new webpack.optimize.DedupePlugin()
    new webpack.optimize.UglifyJsPlugin()
)

gulp.task 'webpack:build', (cb) ->
  webpack prodConfig, (err, stats) ->
    if err
        throw new gutil.PluginError('webpack:build', err)
    
    gutil.log '[webpack:build]', stats.toString 
      colors: true
    
    
    cb()

webpackDevConfig = Object.create webpackConfig
webpackDevConfig.devtool = 'eval'
webpackDevConfig.debug = true
webpackDevCompiler = webpack webpackDevConfig

gulp.task 'webpack-dev-server', (cb) ->
  new WebpackDevServer webpack(webpackDevConfig),
    contentBase: './dist/'
    quiet: false
    noInfo: false
    lazy: false
    watchDelay: 300
    stats:
      colors: true
      
  .listen '8000', '0.0.0.0', (err) ->
    if err 
      throw new gutil.PluginError 'webpack-dev-server', err
    gutil.log '[webpack-dev-server]', 'http://localhost:8000'

  
# config
gulp.task 'config', ->
  gulp.src './src/config/_default.json'
    .pipe gulpNgConfig 'tthew.config'
    .pipe gulp.dest './config'

# gulp other, moves changed files from source to other
gulp.task 'other', ->
  gulp.src paths.other
  .pipe changed paths.distDir
  .pipe gulp.dest paths.distDir

gulp.task 'test', () ->
  karmaServer.start 
    configFile: __dirname + '/karma.conf.coffee',
    singleRun: true
  

# gulp clearTarget 
# clears dist directory
rimraf = require 'rimraf'
gulp.task 'clearTarget', ->
  rimraf.sync paths.distDir, gutil.log

#gulp build
gulp.task 'build', [
  'clearTarget',
  'webpack:build',
  'other'
]

# gulp watch
gulp.task 'watch', ['clearTarget', 'other'], ->
  webpack webpackDevConfig
    .watch 200, (err, stats) ->
      if (err)
        throw new gutil.PluginError 'webpack', err
      gutil.log '[webpack]', stats.toString
        colors: true
  
  gulp.watch paths.other, ['other']

# serve
gulp.task 'serve', ['config', 'webpack-dev-server', 'watch']

# gulp
gulp.task 'default', ['build']

