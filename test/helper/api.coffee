fs            = require "fs"
sys           = require 'sys'
chai          = require "chai"
fsx           = require "fs-extra"
exec          = require('child_process').exec

assert        = chai.assert
baseDir       = process.cwd()
tmpDir        = "#{baseDir}/test/tmp"
fixturesDir   = "#{baseDir}/test/fixtures"
chai.Assertion.includeStack = true

exports = module.exports = class Api

  # -----------------------------------------------------------------------------------------------
  # ~ Public static methods
  # -----------------------------------------------------------------------------------------------

  @less: (path, done) ->
    cmd = ['lessc', 'source', 'actual']
    Api._render "less", cmd, path, done

  @scss: (path, done) ->
    cmd = ['sass', 'source', 'actual']
    Api._render "sass", cmd, path, done

  @sass: (path, done) ->
    cmd = ['sass', 'source', 'actual']
    Api._render "sass", cmd, path, done

  @stylus: (path, done) ->
    cmd = ['stylus', '-o', 'tmpDir', 'source']
    Api._render "styl", cmd, path, done

  # -----------------------------------------------------------------------------------------------
  # ~ Private static methods
  # -----------------------------------------------------------------------------------------------

  @_render: (extension, cmd, path, done) ->

    # variables
    source = "#{fixturesDir}/#{path}/source.#{extension}"
    expected = "#{fixturesDir}/#{path}/expected.css"
    actual = "#{tmpDir}/source.css"

    # cleanup
    if (fs.existsSync(tmpDir)) then fsx.removeSync(tmpDir)
    fs.mkdirSync(tmpDir)

    assert.isTrue fs.existsSync(source), "source file exists " + source
    sourceContent = fs.readFileSync source, "utf-8"
    assert.isString sourceContent

    for value, key in cmd
      try
        tmp = eval(value)
        if tmp? then cmd[key] = tmp
      catch error
        # nothing

    exec cmd.join(' '), (error, stdout, stderr) ->
      if stderr then sys.puts(stderr)

      assert.isTrue fs.existsSync(actual), "actual file exists " + actual
      assert.isTrue fs.existsSync(expected), "expected file exists " + expected

      actualContent = fs.readFileSync actual, "utf-8"
      expectedContent = fs.readFileSync expected, "utf-8"

      assert.isString actualContent
      assert.isString expectedContent

      fs.writeFileSync actual, actualContent
      assert.equal expectedContent.replace(/\r?\n|\r| /g, ''), actualContent.replace(/\r?\n|\r| /g, '')
      done()

