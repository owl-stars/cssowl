"use strict"

chai = require('chai')
grunt = require('grunt')

assert = chai.assert
chai.Assertion.includeStack = true

# See http://visionmedia.github.io/mocha/ for Mocha tests.
# See http://chaijs.com/api/assert/ for Chai assertion types.

baseDir       = process.cwd()
tmpDir        = "#{baseDir}/test/tmp"
fixturesDir   = "#{baseDir}/test/fixtures"

module.exports = class Helper

  # -----------------------------------------------------------------------------------------------
  # ~ Public static methods
  # -----------------------------------------------------------------------------------------------

  @less: (name, done) ->
    Helper.compare name, "less", done

  @scss: (name, done) ->
    Helper.compare name, "scss", done

  @sass: (name, done) ->
    Helper.compare name, "sass", done

  @stylus: (name, done) ->
    Helper.compare name, "styl", done

  # -----------------------------------------------------------------------------------------------
  # ~ Private static methods
  # -----------------------------------------------------------------------------------------------

  ###
  Compare a file from the fixtures directory with a file from the tmp directory
  @param {String} name
  @param {String} extension
  @param {Function} done
  ###
  @compare: (name, extension, done) ->

    # variables
    actual = "#{tmpDir}/#{name}.#{extension}.css"
    expected = "#{fixturesDir}/#{name}.#{extension}.css"

    assert.isTrue grunt.file.exists(actual), "actual file exists " + actual
    assert.isTrue grunt.file.exists(expected), "expected file exists " + expected

    actualContent = grunt.file.read(actual)
    expectedContent = grunt.file.read(expected)

    assert.isString actualContent
    assert.isString expectedContent

    assert.equal expectedContent, actualContent
    done()

  ###
  Compare a file from the fixtures directory with all files from the tmp directory
  @param {String} name
  @param {Array} extensions
  @param {Function} done
  ###
  @compareAll: (name, extensions, done) ->
    actual = null

    for extension in extensions
      unless actual?
        actual = "#{tmpDir}/#{name}.#{extension}.min.css"
        assert.isTrue grunt.file.exists(actual), "actual file exists " + actual
        actualContent = grunt.file.read actual
        assert.isString actualContent
      else
        expected = "#{tmpDir}/#{name}.#{extension}.min.css"
        assert.isTrue grunt.file.exists(expected), "expected file exists " + expected
        expectedContent = grunt.file.read(expected)
        assert.isString expectedContent
        assert.equal expectedContent, actualContent

    done()

  ###
  Compare all file from the tmp directory to be empty
  @param {String} name
  @param {Array} extensions
  @param {Function} done
  ###
  @compareAllEmpty: (name, extensions, done) ->

    for extension in extensions
      expected = "#{tmpDir}/#{name}.#{extension}.css"
      assert.isTrue grunt.file.exists(expected), "expected file exists " + expected
      expectedContent = grunt.file.read(expected)
      assert.isString expectedContent
      assert.equal expectedContent, ""

    done()
