module.exports = (grunt) ->

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
          "test/tmp/cssowl.less.css": "lib/less/cssowl.less"
          "test/tmp/examples.less.css": "test/fixtures/less/examples.less"

    sass:
      test:
        files:
          "test/tmp/cssowl.sass.css": "lib/sass/cssowl.sass"
          "test/tmp/examples.sass.css": "test/fixtures/sass/examples.sass"
          "test/tmp/cssowl.scss.css": "lib/scss/cssowl.scss"
          "test/tmp/examples.scss.css": "test/fixtures/scss/examples.scss"

    stylus:
      test:
        options:
          compress: false
        files:
          "test/tmp/cssowl.styl.css": "lib/stylus/cssowl.styl"
          "test/tmp/examples.styl.css": "test/fixtures/styl/examples.styl"

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
          "display-property-grouping": false
        src: ['test/**/*.css']

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
  grunt.loadNpmTasks "grunt-contrib-csslint"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-cssmin"

  # Register tasks
  grunt.registerTask 'default', ['coffeelint']
  grunt.registerTask 'test', ['default', 'clean', 'less', 'sass', 'stylus', 'csslint', 'cssmin', 'mochaTest']
