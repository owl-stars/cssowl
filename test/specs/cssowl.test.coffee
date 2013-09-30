api = require "../inc/api"

module.exports =
  "Test #cssowl":
    "#sprite":
      "#less": (done) ->
        api.less "sprite", done
      "#scss": (done) ->
        api.scss "sprite", done
      "#sass": (done) ->
        api.sass "sprite", done
      "#stylus": (done) ->
        api.stylus "sprite", done

