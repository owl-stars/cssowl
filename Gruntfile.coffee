###
cssowl
https://github.com/owl-stars/cssowl

Copyright (c) 2013 Owl-Stars
Licensed under the MIT license.
###

"use strict"

librarianowl = require('librarianowl')

module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"

    coffeelint:
      files: ["Gruntfile.coffee", "test/**/*.coffee"]
      options:
        max_line_length:
          value: 200
          level: "error"

    clean:
      test:
        src: ["test/tmp"]

    less:
      test:
        files:
          "test/tmp/examples.less.css": "test/fixtures/examples.less"

    sass:
      test:
        files:
          "test/tmp/examples.sass.css": "test/fixtures/examples.sass"
          "test/tmp/examples.scss.css": "test/fixtures/examples.scss"

    stylus:
      test:
        options:
          compress: false
        files:
          "test/tmp/examples.styl.css": "test/fixtures/examples.styl"

    csslint:
      test:
        options:
          "text-indent": false
          "adjoining-classes": false
          "duplicate-background-images": false
        src: ['test/tmp/*.css']

    # Unit tests.
    mochacov:
      options:
        bail: true
        ui: 'exports'
        require: 'coffee-script'
        compilers: ['coffee:coffee-script']
        files: 'test/specs/**/*.test.coffee'
      all:
        options:
          reporter: 'spec'

    # Deployment
    bumper:
      options:
        tasks: ["default"]
        files: ["package.json", 'bower.json']
        updateConfigs: ["pkg"]

  # Custom task for library generation
  grunt.registerTask "librarianowl", ->
    librarianowl.library "src", "lib",
      helpers: "tools/lib-helpers.js"
      template: "tools/lib-template.hbs"

  # Load npm tasks
  grunt.loadNpmTasks "grunt-mocha-cov"
  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-less"
  grunt.loadNpmTasks "grunt-contrib-stylus"
  grunt.loadNpmTasks "grunt-contrib-csslint"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-bumper"

  # Register tasks
  grunt.registerTask 'default', ['coffeelint', 'librarianowl']
  grunt.registerTask 'test', ['default', 'clean', 'less', 'sass', 'stylus', 'csslint', 'mochacov']
