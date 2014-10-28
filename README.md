# tthew-resume

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

Ok, so there actually aren't any tests. But if there were you would do something like this to run the full test suite (unit + e2e):

    > gulp test

Or like this to run either `unit` or `e2e` tests

    > gulp unit-tests

    > gulp e2e-tests




