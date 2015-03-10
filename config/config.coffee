
bower = require('wiredep')({})

module.exports =

  watch:
    coffee: [
      "app/scripts/*.coffee"
      "app/scripts/**/*.coffee"
    ]
    sass: [
      "app/styles/*.sass"
      "app/styles/**/*.sass"
    ]
    templates: [
      "app/templates/*.jade"
      "app/templates/**/*.jade"
    ]
    index: ["app/index.html "]

  input:
    index: "app/index.html"
    img:  "app/static/img/*"
    fonts: "app/static/fonts/*"
    sprites: "app/static/sprites/*"

    coffee: [
      "app/scripts/*.coffee"
      "app/scripts/**/*.coffee"
      "!app/scripts/lib/*.coffee"
      "!app/scripts/lib/**/*.coffee"
    ]
    sass: ["app/styles/main.sass"]

    sass_loadpath: [
      "app/styles/lib/"
     # "bower_components/bootstrap-sass/lib/"
     # "bower_components/bourbon/dist/"
     # "bower_components/"
    ]
    vendor_css: bower.css
    vendor_js: bower.js

    templates: [
      "app/templates/*.jade"
      "app/templates/**/*.jade"
      "!app/templates/lib/**"
    ]

  output:
    root: "public"
    index: "public/index.html"

    assets:
      js: 'js',
      fonts: 'fonts',
      css: 'css',
      img: 'img',
      sprites: 'img/sprites'
      static: 'static'

    build:
      js: "build.js"
      css: "build.css"

    compiled:
      prefix: 'compiled'
      vendor_js: "compiled.1.vendor_js.js"
      templates: "compiled.2.templates.js"
      coffee: "compiled.3.coffee.js"
      vendor_css: "compiled.1.css.css"
      sass: "compiled.2.sass.css"

