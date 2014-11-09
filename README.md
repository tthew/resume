# tthew-resume

![Build Status](https://travis-ci.org/tthew/resume.svg)

An Angular.js based Single Page 'Resumé' Application leveraging the [Contentful](http://contentful.com) API.

Demonstrating:

- Modular design with the help of Webpack
- Self-documenting project structure
- Stateful GUI utilising ui.router
- RESTful data consumption backed by the Contentful API
- Build Environment using Gulp.js


## Demo

[View a live demo of the Resumé SPA here](http://tthew.github.io/resume)

## Prerequisites

- Node
- Npm
- Gulp
- Bower

### Installation

    > git clone git@github.com:tthew/resume.git
    > cd resume
    > npm install && bower install

#### Running the development server

    > gulp serve

#### Running the test suite

Ok, so the test suite is fairly thin on the ground, currently comprising of only a handful of unit tests. Imagining for a moment that we actually had good coverage you would do something like this to run the full suite (unit + e2e):

    > gulp test

Or like this to run either `unit` or `e2e` tests in isolation:
    
    # Unit Tests
    > gulp test:unit
    
    # Integration Tests
    > gulp test:e2e
