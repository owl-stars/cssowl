# This is a format definition file for the Spriteowl Stylesheet generator.
spriteowl.formats.cssowl =
  version: "1.0.x"
  basepath: ["cssowl", "sprite"]
  packages: [
    "name": "cssowl"
    "mixins": []
    packages: [
      name: "sprite"
      mixins: [
      # --- display -------------------------------------------------------------------------------
        name: "display"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"} ]
        content:
          "@cssowl.sprite.display":"@{x}, @{y}, @{width}, @{height}, @{src}"
      ,
        name: "display-block"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"} ]
        content:
          "@cssowl.sprite.display-block":"@{x}, @{y}, @{width}, @{height}, @{src}"
      ,
        name: "display-inline"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"}, {name:"yOffset", defaults:0}, {name:"valign", defaults:"middle"} ]
        content:
          "@cssowl.sprite.display-inline":"@{x}, @{y}, @{width}, @{height}, @{src}, @{yOffset}, @{valign}"
      # --- replace -------------------------------------------------------------------------------
      ,
        name: "replace"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"} ]
        content:
          "@cssowl.sprite.replace":"@{x}, @{y}, @{width}, @{height}, @{src}"
      ,
        name: "replace-block"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"} ]
        content:
          "@cssowl.sprite.replace-block":"@{x}, @{y}, @{width}, @{height}, @{src}"
      ,
        name: "replace-inline"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"}, {name:"yOffset", defaults:0}, {name:"valign", defaults:"middle"} ]
        content:
          "@cssowl.sprite.replace-inline":"@{x}, @{y}, @{width}, @{height}, @{src}, @{yOffset}, @{valign}"
      # --- absolute ------------------------------------------------------------------------------
      ,
        name: "absolute"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"}, {name:"top", defaults:"none"}, {name:"right", defaults:"none"}, {name:"bottom", defaults:"none"}, {name:"left", defaults:"none"} ]
        content:
          "@cssowl.sprite.absolute":"@{x}, @{y}, @{width}, @{height}, @{src}, @{top}, @{right}, @{bottom}, @{left}"
      ,
        name: "absolute-inside"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"}, {name:"valign", defaults:"top"}, {name:"halign", defaults:"left"}, {name:"xOffset", defaults:0}, {name:"yOffset", defaults:0} ]
        content:
          "@cssowl.sprite.absolute-inside":"@{x}, @{y}, @{width}, @{height}, @{src}, @{valign}, @{halign}, @{xOffset}, @{yOffset}"
      ,
        name: "absolute-outside"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"}, {name:"valign", defaults:"top"}, {name:"halign", defaults:"left"}, {name:"xOffset", defaults:0}, {name:"yOffset", defaults:0} ]
        content:
          "@cssowl.sprite.absolute-outside":"@{x}, @{y}, @{width}, @{height}, @{src}, @{valign}, @{halign}, @{xOffset}, @{yOffset}"
      # --- float ---------------------------------------------------------------------------------
      ,
        name: "float-left"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"}, {name:"xOffset", defaults:0}, {name:"yOffset", defaults:0} ]
        content:
          "@cssowl.sprite.float-left":"@{x}, @{y}, @{width}, @{height}, @{src}, @{xOffset}, @{yOffset}"
      ,
        name: "float-right"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"}, {name:"xOffset", defaults:0}, {name:"yOffset", defaults:0} ]
        content:
          "@cssowl.sprite.float-right":"@{x}, @{y}, @{width}, @{height}, @{src}, @{xOffset}, @{yOffset}"
      # --- before --------------------------------------------------------------------------------
      ,
        name: "before"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"} ]
        content:
          "@cssowl.sprite.before":"@{x}, @{y}, @{width}, @{height}, @{src}"
      ,
        name: "before-inline"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"}, {name:"xOffset", defaults:0}, {name:"yOffset", defaults:0}, {name:"valign", defaults:"middle"} ]
        content:
          "@cssowl.sprite.before-inline":"@{x}, @{y}, @{width}, @{height}, @{src}, @{xOffset}, @{yOffset}, @{valign}"
      ,
        name: "before-float"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"}, {name:"xOffset", defaults:0}, {name:"yOffset", defaults:0} ]
        content:
          "@cssowl.sprite.before-float":"@{x}, @{y}, @{width}, @{height}, @{src}, @{xOffset}, @{yOffset}"
      ,
        name: "before-absolute"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"}, {name:"top", defaults:"none"}, {name:"right", defaults:"none"}, {name:"bottom", defaults:"none"}, {name:"left", defaults:"none"} ]
        content:
          "@cssowl.sprite.before-absolute":"@{x}, @{y}, @{width}, @{height}, @{src}, @{top}, @{right}, @{bottom}, @{left}"
      ,
        name: "before-absolute-inside"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"}, {name:"valign", defaults:"top"}, {name:"halign", defaults:"left"}, {name:"xOffset", defaults:0}, {name:"yOffset", defaults:0} ]
        content:
          "@cssowl.sprite.before-absolute-inside":"@{x}, @{y}, @{width}, @{height}, @{src}, @{valign}, @{halign}, @{xOffset}, @{yOffset}"
      ,
        name: "before-absolute-outside"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"}, {name:"valign", defaults:"top"}, {name:"halign", defaults:"left"}, {name:"xOffset", defaults:0}, {name:"yOffset", defaults:0} ]
        content:
          "@cssowl.sprite.before-absolute-outside":"@{x}, @{y}, @{width}, @{height}, @{src}, @{valign}, @{halign}, @{xOffset}, @{yOffset}"
      # --- after ---------------------------------------------------------------------------------
      ,
        name: "after"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"} ]
        content:
          "@cssowl.sprite.after":"@{x}, @{y}, @{width}, @{height}, @{src}"
      ,
        name: "after-inline"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"}, {name:"xOffset", defaults:0}, {name:"yOffset", defaults:0}, {name:"valign", defaults:"middle"} ]
        content:
          "@cssowl.sprite.after-inline":"@{x}, @{y}, @{width}, @{height}, @{src}, @{xOffset}, @{yOffset}, @{valign}"
      ,
        name: "after-float"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"}, {name:"xOffset", defaults:0}, {name:"yOffset", defaults:0} ]
        content:
          "@cssowl.sprite.after-float":"@{x}, @{y}, @{width}, @{height}, @{src}, @{xOffset}, @{yOffset}"
      ,
        name: "after-absolute"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"}, {name:"top", defaults:"none"}, {name:"right", defaults:"none"}, {name:"bottom", defaults:"none"}, {name:"left", defaults:"none"} ]
        content:
          "@cssowl.sprite.after-absolute":"@{x}, @{y}, @{width}, @{height}, @{src}, @{top}, @{right}, @{bottom}, @{left}"
      ,
        name: "after-absolute-inside"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"}, {name:"valign", defaults:"top"}, {name:"halign", defaults:"left"}, {name:"xOffset", defaults:0}, {name:"yOffset", defaults:0} ]
        content:
          "@cssowl.sprite.after-absolute-inside":"@{x}, @{y}, @{width}, @{height}, @{src}, @{valign}, @{halign}, @{xOffset}, @{yOffset}"
      ,
        name: "after-absolute-outside"
        args: [ {name:"x"}, {name:"y"}, {name:"width"}, {name:"height"}, {name:"src"}, {name:"valign", defaults:"top"}, {name:"halign", defaults:"left"}, {name:"xOffset", defaults:0}, {name:"yOffset", defaults:0} ]
        content:
          "@cssowl.sprite.after-absolute-outside":"@{x}, @{y}, @{width}, @{height}, @{src}, @{valign}, @{halign}, @{xOffset}, @{yOffset}"
      ]
      packages: []
    ]
  ]
