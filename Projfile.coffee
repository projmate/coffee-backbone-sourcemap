exports.project = (pm) ->
  f = pm.filters()
  $ = pm.shell()

  # Change asset filename roots to "dist"
  distDir = _filename: { replace: [/^src/, "dist"] }

  addJsHeader = f.addHeader filename: "res/copyright.js"

  "app.js":
    description: "Creates app.js CommonJS module from src/app_js"
    files:
      include: ["src/js/app_js/**/*.coffee", "src/js/app_js/**/*.js"]
      # hack for WebStorm, app.js has to be built in same directory for source
      # maps to work
      exclude: ["src/js/app_js/app.js"]

    development: [
      # source map is default in development environment
      f.coffee(bare: true)

      f.commonJsify(baseDir: "src/js/app_js", packageName: "app",  filename: "src/js/app_js/app.js")

      # Write assets to "dist" directory
      f.writeFile
    ]

    production: [
      f.coffee(bare: true)
      # file isn't written at this step, the writeFile filter replaces "src" with "dist"
      f.commonJsify(baseDir: "src/js/app_js", packageName: "app",  filename: "src/js/app_js/app.js")
      f.uglify
      addJsHeader
      f.writeFile(distDir)
    ]

  clean:
    development: ->
      $.rm_rf "dist"
      $.rm "-f", "src/js/app_js/app.*"

  staticFiles:
    development: ->
      $.cp_f "src/index.html", "dist"

  dist:
    pre: ["clean", "app.js", "staticFiles"]
