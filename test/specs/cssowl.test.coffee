"use strict"

chai = require('chai')
grunt = require('grunt')
ndd = require("node-dir-diff")

assert = chai.assert
chai.Assertion.includeStack = true

# See http://visionmedia.github.io/mocha/ for Mocha tests.
# See http://chaijs.com/api/assert/ for Chai assertion types.

baseDir = process.cwd()

module.exports =
  "Test #cssowl":
    "#all": (done) ->
      new ndd.Dir_Diff([
          "#{baseDir}/test/tmp"
          "#{baseDir}/test/expected"
        ],
        "size"
      ).compare (err, result) ->
        assert.equal result.deviation, 0
        done()

