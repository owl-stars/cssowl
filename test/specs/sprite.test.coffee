api = require "../helper/api"

module.exports =
  "#cssowl":
    "#sprite":
      "#less": (done) ->
        api.less "sprite", done
      "#scss": (done) ->
        api.scss "sprite", done
      "#sass": (done) ->
        api.sass "sprite", done
      "#stylus": (done) ->
        api.stylus "sprite", done

