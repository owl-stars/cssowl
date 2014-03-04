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
        src: ["test/tmp", "test/examples"]

    less:
      test:
        files:
          "test/tmp/examples.less.css": "test/fixtures/less/cssowl.less"

    sass:
      test:
        options:
          trace: true
        files:
          "test/tmp/examples.sass.css": "test/fixtures/sass/cssowl.sass"
          "test/tmp/examples.scss.css": "test/fixtures/scss/cssowl.scss"

    stylus:
      test:
        options:
          compress: false
        files:
          "test/tmp/examples.styl.css": "test/fixtures/styl/cssowl.styl"

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
        push: false
        createTag: false
        tasks: ["default"]
        files: ["package.json", 'bower.json']
        updateConfigs: ["pkg"]

  # Custom task for fixtures generation
  grunt.registerTask "librarianowl-examples", ->
    librarianowl.compile "src", "test/examples",
      template: "resources/librarianowl/template-examples.hbs"

  # Custom task for library generation
  grunt.registerTask "librarianowl-lib", ->
    librarianowl.compile "src", "lib", {
      helpers: "resources/librarianowl/helpers.js"
      template: "resources/librarianowl/template-library.hbs"
    }

  # Custom task for library generation
  grunt.registerTask "librarianowl-docs", ->
    librarianowl.compile "src", "docs/source/partials", {
      filename: (item, syntax) ->
        return "_" + item.module + ".haml"
      filter: (filename) ->
        return (filename != '_imports.yml')
      helpers: "resources/librarianowl/helpers.js"
      template: "resources/librarianowl/template-docs.hbs"
    }

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
  grunt.registerTask 'default', ['coffeelint', 'librarianowl-lib']
  grunt.registerTask 'test', ['default', 'clean', 'librarianowl-examples', 'sass', 'less', 'stylus', 'csslint', 'mochacov']
  grunt.registerTask 'docs', ['default', 'clean', 'librarianowl-examples', 'librarianowl-docs']
