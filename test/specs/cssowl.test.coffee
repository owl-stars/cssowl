"use strict"

helper = require "./helper"

module.exports =
  "Test #cssowl":
    "#examples":
      "#empty": (done) ->
        helper.compareAllEmpty("cssowl", ['less', 'sass', 'scss', 'styl'], done)
      "#less": (done) ->
        helper.less("examples", done)
      "#scss": (done) ->
        helper.scss("examples", done)
      "#sass": (done) ->
        helper.sass("examples", done)
      "#stylus": (done) ->
        helper.stylus("examples", done)
      "#all": (done) ->
        helper.compareAll("examples", ['less', 'sass', 'scss', 'styl'], done)

