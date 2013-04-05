module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    coffeelint:
      files: [
        "test/**/*.coffee"
      ]
      options:
        max_line_length:
          value: 200
          level: "error"

    mochaTest:
      sprite: ["test/specs/sprite.test.coffee"]

    mochaTestConfig:
      options:
        compilers: 'coffee:coffee-script'
        reporter: 'list'
        timeout: 10000
        ui: 'exports'
        bail: true

  # Load npm tasks
  grunt.loadNpmTasks "grunt-mocha-test"
  grunt.loadNpmTasks "grunt-coffeelint"

  # Register tasks
  grunt.registerTask 'default', ['coffeelint', 'mochaTest']
