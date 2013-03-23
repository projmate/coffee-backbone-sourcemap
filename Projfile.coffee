exports.project = (pm) ->
  f = pm.filters()
  $ = pm.shell()

  # Change asset filename dir to "dist"
  distDir = _filename: { replace: [/^src/, "dist"] }

  # Add javascript header filter
  addJsHeader = f.addHeader filename: "res/copyright.js"

  "app.js":
    description: "Creates app.js CommonJS module from src/app_js"
    files:
      include: ["src/js/app_js/**/*.coffee", "src/js/app_js/**/*.js"]
      # app.js has to be built in same directory for source maps to work on WebStorm
      exclude: ["src/js/app_js/app.js"]

    development: [
      # sourceMap is on by default
      f.coffee(bare: true)
      f.commonJsify(baseDir: "src/js/app_js", packageName: "app", filename: "src/js/app_js/app.js")
      f.writeFile
    ]

    production: [
      # sourceMap is off by default in production
      f.coffee(bare: true)
      # file isn't written at this step, the writeFile filter replaces "src" with "dist"
      f.commonJsify(baseDir: "src/js/app_js", packageName: "app", filename: "src/js/app_js/app.js")
      f.uglify
      addJsHeader
      f.writeFile(distDir)
    ]

  clean:
    development: ->
      $.rm_rf "dist"
      $.rm "-f", "src/js/app_js/app.*"

  dist:
    pre: ["clean", "app.js"]

    development: ->
      $.cp_f "src/index.html", "dist"



