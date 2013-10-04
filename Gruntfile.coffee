module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"

    coffeelint:
      files: ["Gruntfile.coffee", "test/specs/**/*.coffee"]
      options:
        max_line_length:
          value: 200
          level: "error"

    less:
      dist:
        files:
          "dummy/less.css": "lib/less/cssowl.less"
          "dummy/less-example.css": "example/less.less"
    stylus:
      dist:
        files:
          "dummy/stylus.css": "lib/stylus/cssowl.styl"
          "dummy/stylus-example.css": "example/stylus.styl"

    sass:
      sass:
        files:
          'dummy/sass.css': 'lib/sass/cssowl.sass'
          'dummy/sass-example.css': 'example/sass.sass'
      scss:
        files:
          'dummy/scss.css': 'lib/scss/cssowl.scss'
          'dummy/scss-example.css': 'example/scss.scss'

    styledocco:
      main:
        options:
          name: '<%= pkg.name %>'
        files: [
          src: 'lib/sass'
          dest: 'docs2'
        ]
      example:
        options:
          name: '<%= pkg.name %>'
        files: [
          src: 'example'
          dest: 'docs'
        ]

    watch:
      styledocco:
        files: ['example/**/*.*', 'lib/**/*.*']
        tasks: ['styledocco']
      options:
        livereload: false

    mochaTest:
      test:
        options:
          bail: true
          ui: 'exports'
          timeout: 10000
          reporter: 'TAP'
        src: ['test/specs/**/*.test.coffee']

  # Load npm tasks
  grunt.loadNpmTasks "grunt-mocha-test"
  grunt.loadNpmTasks "grunt-styledocco"
  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-less"
  grunt.loadNpmTasks "grunt-contrib-stylus"

  # Register tasks
  grunt.registerTask 'default', ['coffeelint', 'sass', 'less', 'stylus', 'styledocco']
  grunt.registerTask 'test', ['default', 'mochaTest']
