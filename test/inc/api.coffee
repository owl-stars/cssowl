fs            = require "fs"
chai          = require "chai"

assert        = chai.assert
baseDir       = process.cwd()
tmpDir        = "#{baseDir}/test/tmp"
fixturesDir   = "#{baseDir}/test/fixtures"
chai.Assertion.includeStack = true

exports = module.exports = class Api

  # -----------------------------------------------------------------------------------------------
  # ~ Public static methods
  # -----------------------------------------------------------------------------------------------

  @less: (name, done) ->
    Api.compare name, "less", done

  @scss: (name, done) ->
    Api.compare name, "scss", done

  @sass: (name, done) ->
    Api.compare name, "sass", done

  @stylus: (name, done) ->
    Api.compare name, "styl", done

  # -----------------------------------------------------------------------------------------------
  # ~ Private static methods
  # -----------------------------------------------------------------------------------------------

  @compare: (name, extension, done) ->

    # variables
    actual = "#{tmpDir}/#{name}.#{extension}.css"
    expected = "#{fixturesDir}/#{name}.#{extension}.css"

    assert.isTrue fs.existsSync(actual), "actual file exists " + actual
    assert.isTrue fs.existsSync(expected), "expected file exists " + expected

    actualContent = fs.readFileSync actual, "utf-8"
    expectedContent = fs.readFileSync expected, "utf-8"

    assert.isString actualContent
    assert.isString expectedContent

    assert.equal expectedContent, actualContent
    done()

  @compareAll: (name, extensions, done) ->
    actual = null

    for extension of extension
      unless actual?
        actual = "#{tmpDir}/#{name}.#{extension}.css"
        assert.isTrue fs.existsSync(actual), "actual file exists " + actual
        actualContent = fs.readFileSync actual, "utf-8"
        assert.isString actualContent
      else
        expected = "#{tmpDir}/#{name}.#{extension}.css"
        assert.isTrue fs.existsSync(expected), "expected file exists " + expected
        expectedContent = fs.readFileSync expected, "utf-8"
        assert.isString expectedContent
        assert.equal expectedContent, actualContent

    done()

  @compareEmpty: (name, extensions, done) ->

    for extension of extension
      expected = "#{tmpDir}/#{name}.#{extension}.css"
      assert.isTrue fs.existsSync(expected), "expected file exists " + expected
      expectedContent = fs.readFileSync expected, "utf-8"
      assert.isString expectedContent
      assert.equal expectedContent, ""

    done()
