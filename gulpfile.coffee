# gulp plugins
gulp = require 'gulp'
changed = require 'gulp-changed'
gutil = require 'gulp-util'

# misc
spawn = require('child_process').spawn
argv = require('minimist')(process.argv.slice(2))

# webpack
webpack = require 'webpack'
webpackConfig = require './webpack.config'
ngminPlugin = require 'ngmin-webpack-plugin'

# Template Cache
templateCache = require 'gulp-angular-templatecache'

if argv.production  # --production option
  webpackConfig.plugins = webpackConfig.plugins.concat new ngminPlugin(),
    new webpack.optimize.UglifyJsPlugin()
  webpackConfig.devtool = false
  webpackConfig.debug = false

ports =
  livereload: 35729

paths =
  other: [
    'src/**'
    '!src/**/*.js'
    '!src/**/*.coffee'
    '!src/**/*.scss'
  ],
  tmpDir: '.tmp',
  targetDir: './target/'

gulp.task 'webpack', (cb) ->
  webpack webpackConfig, (err, stats) ->
    if (err)
      throw new gutil.PluginError 'webpack', err
    gutil.log '[webpack]', stats.toString
      colors: true
    cb()
  
# gulp other, moves changed files from source to other
gulp.task 'other', ->
  gulp.src paths.other
  .pipe changed paths.targetDir
  .pipe gulp.dest paths.targetDir

# gulp clearTarget 
# clears target directory
rimraf = require 'rimraf'
gulp.task 'clearTarget', ->
  rimraf.sync paths.targetDir, gutil.log
  rimraf.sync paths.tmpDir, gutil.log

#gulp build
gulp.task 'build', [
  'clearTarget',
  'templates',
  'webpack',
  'other'
]

# gulp watch
gulp.task 'watch', ['clearTarget', 'templates', 'other'], ->

  webpack webpackConfig
  .watch 200, (err, stats) ->
    if (err)
      throw new gutil.PluginError 'webpack', err
    gutil.log '[webpack]', stats.toString
      colors: true

  gulp.watch paths.other, ['other']

gulp.task 'templates', -> 
  gulp.src 'src/**/*.tpl.html'
    .pipe templateCache()
    .pipe gulp.dest paths.tmpDir + '/scripts'


# gulp

gulp.task 'default', ['build']

