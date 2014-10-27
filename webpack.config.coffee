path = require 'path'
webpack = require 'webpack'
ngminPlugin = require 'ngmin-webpack-plugin'
HtmlWebpackPlugin = require 'html-webpack-plugin'
ExtractTextPlugin = require 'extract-text-webpack-plugin'
appRoot = "#{__dirname}/src"
bowerRoot = "#{__dirname}/bower_components"

module.exports =
  cache: true
  debug: true

  # The entry point
  entry: [
    # "#{__dirname}/.tmp/scripts/templates.js"
    "#{appRoot}/app.coffee"
  ]

  output:
    path: path.join __dirname, './dist'
    publicPath: './'
    libraryTarget: "var",
    filename: "[hash].bundle.js",
		chunkFilename: "[chunkhash].js"


  module:
    loaders: [
      # required to write 'require('./style.css')'
      test: /\.css$/
      loaders: ['style','css']
    ,
      test: /\.scss$/,
      loader: "style!css!sass?outputStyle=expanded&includePaths[]=#{bowerRoot}/"
    ,
      test: /\.coffee$/
      loader: 'coffee'
    ,
      # require raw html for partials
      test: /\.html$/
      loader: 'ng-cache?prefix=//[dir]/[dir]'
    ,
      # required for bootstrap icons
      test: /\.woff(\?(.*))?$/
      loader: 'url?prefix=factorynts/&limit=5000&mimetype=application/font-woff'
    ,
      test: /\.ttf(\?(.*))?$/
      loader: 'file?prefix=fonts/'
    ,
      test: /\.eot(\?(.*))?$/
      loader: 'file?prefix=fonts/'
    ,
      test: /\.svg(\?(.*))?$/
      loader: 'file?prefix=fonts/'
    ]

    # externals: 
    #   'showdown': 'Showdown'

    # don't parse some dependencies to speed up build.
    # can probably do this non-AMD/CommonJS deps
    noParse: [
      path.join bowerRoot, '/contentful/dist/contentful.js'
      path.join bowerRoot, '/jquery/dist/jquery.js'
      path.join bowerRoot, '/angular-route'
      path.join bowerRoot, '/angular-ui-router'
      path.join bowerRoot, '/angular-sanitize'
      path.join bowerRoot, '/angular-ui-select'
      path.join bowerRoot, '/angular-mocks'
      path.join bowerRoot, '/angular'
    ]
  #   
  # node:
  #   fs: "mock"
  
  resolve:
    alias:
      bower: bowerRoot

    extensions: [
      ''
      '.js'
      '.coffee'
      '.scss'
      '.css'
    ]

    root: [appRoot]

  plugins: [
    # bower.json resolving
    new webpack.ResolverPlugin [
      new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin "bower.json", ["main"]
    ], ["normal", "loader"]

    # disable dynamic requires
    new webpack.ContextReplacementPlugin(/.*$/, /a^/)

    new webpack.ProvidePlugin 
      'angular': 'exports?window.angular!bower/angular'
    new HtmlWebpackPlugin
      template: 'src/index.html'
    # new ExtractTextPlugin "[name].css",
    #   allChunks: true
    new webpack.ProvidePlugin 
     "contentful": "contentful"
 
    # new webpack.ProvidePlugin 
    #  "showdown": "Showdown"
  ]

  devtool: 'eval'
