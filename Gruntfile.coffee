###
cssowl
https://github.com/owl-stars/cssowl

Copyright (c) 2013 Owl-Stars
Licensed under the MIT license.
###

module.exports = (grunt) ->
  "use strict"

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
      docs:
        src: ["docs/cssowl/", "docs/examples/"]
      css:
        src: ["lib/**/*.css", "docs/fixtures/*.css"]
      test:
        src: ["test/tmp"]

    less:
      test:
        files:
          "test/tmp/cssowl.less.css": "lib/less/cssowl.less"
          "test/tmp/examples.less.css": "docs/fixtures/examples.less"

    sass:
      test:
        files:
          "test/tmp/cssowl.sass.css": "lib/sass/cssowl.sass"
          "test/tmp/examples.sass.css": "docs/fixtures/examples.sass"
          "test/tmp/cssowl.scss.css": "lib/scss/cssowl.scss"
          "test/tmp/examples.scss.css": "docs/fixtures/examples.scss"

    stylus:
      test:
        options:
          compress: false
        files:
          "test/tmp/cssowl.styl.css": "lib/stylus/cssowl.styl"
          "test/tmp/examples.styl.css": "docs/fixtures/examples.styl"

    cssmin:
      test:
        files:
          'test/tmp/examples.less.min.css': ['test/tmp/examples.less.css']
          'test/tmp/examples.sass.min.css': ['test/tmp/examples.sass.css']
          'test/tmp/examples.scss.min.css': ['test/tmp/examples.scss.css']
          'test/tmp/examples.styl.min.css': ['test/tmp/examples.styl.css']

    csslint:
      test:
        options:
          "text-indent": false
          "adjoining-classes": false
          "duplicate-background-images": false
        src: ['test/tmp/*.css']

    styledocco:
      cssowl:
        options:
          name: '<%= pkg.name %> v<%= pkg.version %>'
        files: [
          src: 'lib/less'
          dest: 'docs/cssowl/less'
        ,
          src: 'lib/sass'
          dest: 'docs/cssowl/sass'
        ,
          src: 'lib/scss'
          dest: 'docs/cssowl/scss'
        ,
          src: 'lib/stylus'
          dest: 'docs/cssowl/stylus'
        ]
      examples:
        options:
          name: '<%= pkg.name %> examples v<%= pkg.version %>'
        files: [
          src: 'docs/fixtures/examples.less'
          dest: 'docs/examples/less'
        ,
          src: 'docs/fixtures/examples.sass'
          dest: 'docs/examples/sass'
        ,
          src: 'docs/fixtures/examples.scss'
          dest: 'docs/examples/scss'
        ,
          src: 'docs/fixtures/examples.styl'
          dest: 'docs/examples/stylus'
        ]

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

  # Load npm tasks
  grunt.loadNpmTasks "grunt-mocha-cov"
  grunt.loadNpmTasks "grunt-styledocco"
  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-less"
  grunt.loadNpmTasks "grunt-contrib-stylus"
  grunt.loadNpmTasks "grunt-contrib-csslint"
  grunt.loadNpmTasks "grunt-contrib-cssmin"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-bumper"

  # Register tasks
  grunt.registerTask 'default', ['coffeelint']
  grunt.registerTask 'docs', ['default', 'clean:docs', 'styledocco', 'clean:css']
  grunt.registerTask 'test', ['default', 'clean:test', 'less', 'sass', 'stylus', 'csslint', 'cssmin', 'mochacov']
