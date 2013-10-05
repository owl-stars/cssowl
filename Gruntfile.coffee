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
      docs:
        src: ["lib/**/*.css", "docs/examples/*.css"]
      test:
        src: ["test/tmp"]

    less:
      test:
        files:
          "test/tmp/cssowl.less.css": "lib/less/cssowl.less"
          "test/tmp/examples.less.css": "docs/examples/examples.less"

    sass:
      test:
        files:
          "test/tmp/cssowl.sass.css": "lib/sass/cssowl.sass"
          "test/tmp/examples.sass.css": "docs/examples/examples.sass"
          "test/tmp/cssowl.scss.css": "lib/scss/cssowl.scss"
          "test/tmp/examples.scss.css": "docs/examples/examples.scss"

    stylus:
      test:
        options:
          compress: false
        files:
          "test/tmp/cssowl.styl.css": "lib/stylus/cssowl.styl"
          "test/tmp/examples.styl.css": "docs/examples/examples.styl"

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
          src: 'docs/examples/examples.less'
          dest: 'docs/examples/less'
        ,
          src: 'docs/examples/examples.sass'
          dest: 'docs/examples/sass'
        ,
          src: 'docs/examples/examples.scss'
          dest: 'docs/examples/scss'
        ,
          src: 'docs/examples/examples.styl'
          dest: 'docs/examples/stylus'
        ]

    watch:
      docs:
        files: [
          'docs/examples/examples.less'
          'docs/examples/examples.sass'
          'docs/examples/examples.scss'
          'docs/examples/examples.styl'
          'lib/**/*.less'
          'lib/**/*.sass'
          'lib/**/*.scss'
          'lib/**/*.styl'
        ]
        tasks: ['docs']
      test:
        files: [
          'docs/examples/examples.*'
          'test/fixtures/*.*'
          'test/**/*.coffee'
          'lib/**/*.less'
          'lib/**/*.sass'
          'lib/**/*.scss'
          'lib/**/*.styl'
        ]
        tasks: ['test']

    mochaTest:
      test:
        options:
          bail: true
          ui: 'exports'
          timeout: 10000
        src: ['test/specs/**/*.test.coffee']

    bump:
      options:
        createTag: false
        commitFiles: ['-a']
        updateConfigs: ['pkg']
        files: ['package.json', 'bower.json']


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
  grunt.loadNpmTasks "grunt-bump"

  # Register tasks
  grunt.registerTask 'default', ['coffeelint']
  grunt.registerTask 'docs', ['default', 'styledocco', 'clean:docs']
  grunt.registerTask 'test', ['default', 'clean:test', 'less', 'sass', 'stylus', 'csslint', 'cssmin', 'mochaTest']
