module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"

    coffeelint:
      files: ["Gruntfile.coffee", "test/specs/**/*.coffee"]
      options:
        max_line_length:
          value: 200
          level: "error"

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
  grunt.loadNpmTasks "grunt-coffeelint"

  # Register tasks
  grunt.registerTask 'default', []
  grunt.registerTask 'test', ['default', 'mochaTest']
