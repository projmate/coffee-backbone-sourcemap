# Supress debug logs
exports.config =
  log:
    level: 'info'


exports.project = (pm) ->
  {f, $} = pm

  # ==== Filters process Assets

  # Change asset filename dir to 'dist'
  distDir = _filename: { replace: [/^src/, 'dist'] }

  # Add javascript header filter
  addJsHeader = f.addHeader filename: '_res/copyright.js'


  # ==== Pipelines use Filters


  # ==== Tasks use Pipelines

  'app.js':
    description: 'Creates app.js CommonJS module from src/app_js'
    files: ['src/js/app_js/**/*.coffee', 'src/js/app_js/**/*.js']
    development: [
      f.coffee(bare: true, sourceMap: true)
      f.commonJs(root: 'src/js/app_js', name: 'app', filename: 'src/js/app.js', sourceMap: true, sourceRoot: '/src/js/app_js')
      f.writeFile(distDir)
    ]
    production: [
      f.coffee(bare: true)
      f.commonJs(root: 'src/js/app_js', name: 'app', filename: 'src/js/app.js')
      f.uglify
      addJsHeader
      f.writeFile(distDir)
    ]

  stylesheets:
    desc: 'Compile less files'
    files: 'src/css/style.less'             # only compile this stylesheet
    watch: ['src/css/**/*.less']            # rebuild on any file change though
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
    desc: 'Compiles Handlebars templates to HTML'
    files: ['src/**/*.hbs', '!src/**/_*.hbs']
    development: [
      f.handlebars(root: 'src')
      f.liveReload
      f.writeFile(distDir)
    ]
    production: [
      f.handlebars(root: 'src')
      f.writeFile(distDir)
    ]


  clean:
    desc: 'Removes generated files'
    dev: ->
      $.rm_rf 'dist'
      $.rm '-f', 'src/js/app_js/app.*'


  staticFiles:
    desc: 'Copy static files'
    dev: ->
      $.cp_rf 'src/img', 'dist'
      $.cp 'src/favicon.ico', 'dist'
      $.rm_rf 'dist/js/vendor'
      $.cp_rf 'jam/*', 'dist/js/vendor'

  components:
    dev: (cb) ->
      $.run 'bower install -d', cb

  all:
    desc: 'Run all tasks'
    pre: ['clean', 'app.js', 'stylesheets', 'pages', 'staticFiles']
