# Projmate project file.
#
# To see tasks
#
#     pm run
#
exports.project = (pm) ->
  f = pm.filters()
  $ = pm.shell()

  # Change asset filename dir to "dist"
  distDir = _filename: { replace: [/^src/, "dist"] }

  # Add javascript header filter
  addJsHeader = f.addHeader filename: "_res/copyright.js"


  "app.js":
    description: "Creates app.js CommonJS module from src/app_js"
    files:
      include: ["src/js/app_js/**/*.coffee", "src/js/app_js/**/*.js"]
    development: [
      # sourceMap is on by default
      f.coffee(bare: true)
      f.commonJsify(baseDir: "src/js/app_js", packageName: "app", filename: "src/js/app.js")
      f.writeFile(distDir)
    ]
    production: [
      # sourceMap is off by default in production
      f.coffee(bare: true)
      # file isn't written at this step, the writeFile filter replaces "src" with "dist"
      f.commonJsify(baseDir: "src/js/app_js", packageName: "app", filename: "src/js/app.js")
      f.uglify
      addJsHeader
      f.writeFile(distDir)
    ]


  stylesheets:
    desc: "Compile less files"
    files:
      include: "src/css/style.less"         # only compile this stylesheet
      watch: ["src/css/**/*.less"]          # rebuild on any file change though
    dev: [
      f.less
      f.writeFile(distDir)
    ]
    production: [
      f.recess(compile: true, compress: true)
      addJsHeader
      f.writeFile(distDir)
    ]


  pages:
    desc: "Compiles Handlebars templates to HTML"
    files: ["src/**/*.hbs", "!src/**/_*.hbs"]
    development: [
      f.handlebars(root: "src")
      f.liveReload
      f.writeFile(distDir)
    ]
    production: [
      f.handlebars(root: "src")
      f.writeFile(distDir)
    ]


  clean:
    desc: "Removes generated files"
    dev: ->
      $.rm_rf "dist"
      $.rm "-f", "src/js/app_js/app.*"


  publicFiles:
    desc: "Copy static files"
    dev: ->
      $.cp_rf "public/*", "dist"


  all:
    desc: "Run all tasks"
    pre: ["clean", "app.js", "stylesheets", "pages", "publicFiles"]


