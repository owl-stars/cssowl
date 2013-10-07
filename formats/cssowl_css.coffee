# This is a format definition file for the Spriteowl Stylesheet generator.
spriteowl.formats.cssowl_css =
  version: "1.0.x"
  basepath: ['cssowl', 'sprite']
  packages: [
    name: "cssowl"
    mixins: []
    packages: [
      name: "sprite"
      mixins: [
      # --- display -------------------------------------------------------------------------------
        name: "display"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"} ]
        content:
          "width": "@{width}"
          "height": "@{height}"
          "background-image": "@{src}"
          "background-repeat": "no-repeat"
          "background-position": "@{x} @{y}"
      ,
        name: "display-block"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"} ]
        content:
          "width": "@{width}"
          "height": "@{height}"
          "display": "block"
          "background-image": "@{src}"
          "background-repeat": "no-repeat"
          "background-position": "@{x} @{y}"
      ,
        name: "display-inline"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"} ]
        content:
          "width": "@{width}"
          "height": "@{height}"
          "display": "inline-block"
          "background-image": "@{src}"
          "background-repeat": "no-repeat"
          "background-position": "@{x} @{y}"
      # --- replace -------------------------------------------------------------------------------
      ,
        name: "replace"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"} ]
        content:
          "width": "@{width}"
          "height": "@{height}"
          "direction": "ltr"
          "text-indent": "-9999px"
          "background-image": "@{src}"
          "background-repeat": "no-repeat"
          "background-position": "@{x} @{y}"
      ,
        name: "replace-block"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"} ]
        content:
          "width": "@{width}"
          "height": "@{height}"
          "display": "block"
          "direction": "ltr"
          "text-indent": "-9999px"
          "background-image": "@{src}"
          "background-repeat": "no-repeat"
          "background-position": "@{x} @{y}"
      ,
        name: "replace-inline"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"} ]
        content:
          "width": "@{width}"
          "height": "@{height}"
          "display": "inline-block"
          "direction": "ltr"
          "text-indent": "-9999px"
          "background-image": "@{src}"
          "background-repeat": "no-repeat"
          "background-position": "@{x} @{y}"
      ]
      packages: []
    ]
  ]