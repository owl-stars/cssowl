"use strict"

chai = require('chai')
grunt = require('grunt')

assert = chai.assert
chai.Assertion.includeStack = true

# See http://visionmedia.github.io/mocha/ for Mocha tests.
# See http://chaijs.com/api/assert/ for Chai assertion types.

baseDir = process.cwd()

compare = (name) ->
  actual = grunt.file.read("test/tmp/#{name}")
  expected = grunt.file.read("test/expected/#{name}")
  return assert.equal(expected, actual, "#{name} should be equal.")

module.exports =
  "Test #cssowl":
    "#sass": () ->
      compare("examples.sass.css")
    "#scss": () ->
      compare("examples.scss.css")
    "#less": () ->
      compare("examples.less.css")
    "#styl": () ->
      compare("examples.styl.css")
  "Test #issues":
    "#sass": () ->
      compare("issues.sass.css")
    "#scss": () ->
      compare("issues.scss.css")
    "#less": () ->
      compare("issues.less.css")
    "#styl": () ->
      compare("issues.styl.css")
