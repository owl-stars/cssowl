api = require process.cwd() + "/test/inc/Api"

module.exports =
  "Test #cssowl":
    "#examples":
      "#empty": (done) ->
        api.compareEmpty "cssowl", ['less', 'sass', 'scss', 'stylus'], done
      "#less": (done) ->
        api.less "examples", done
      "#scss": (done) ->
        api.scss "examples", done
      "#sass": (done) ->
        api.sass "examples", done
      "#stylus": (done) ->
        api.stylus "examples", done
      "#all": (done) ->
        api.compareAll "examples", ['less', 'sass', 'scss', 'stylus'], done

