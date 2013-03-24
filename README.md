# coffee-backbone-sourcemap

Projmate CoffeeScript and Backbone example with support for source maps.
Debug your CoffeeScript templates and source! What's inside?

* CommonJS simplicity
* Debuggable CoffeeScript everywhere


More documentation is forthcoming for Projmate, which is a GUI project editor
based on likes/dislikes about Jake, Grunt and deploying production sites.
The project is several weekends of effort and the CLI is already useful.

* Builds are based on environments (development, test, production)
* Simple filters and pipelines for asset processing


## Instructions

*   Install Projmate build tool

        npm install projmate-cli@0.1.0-dev -g

*   Clone the project

        git clone git://github.com/projmate/coffee-backbone-sourcemap.git

*   Serve and watch files, then debug in the browser

        cd coffee-backbone-sourcemap
        pm run app.js --serve src --watch

*   Browse `index.html` locally.

        http://local.projmate.com:1080
        https://local.projmate.com:1443

*   To build and browse production files

        pm run dist -e production
        pm serve dist


## Debugging

As of this writing, Chrome 26.0.1410.40 beta works well with wource maps.
the stable version does not stop on breakpoints.

*   From terminal

        pm run app.js --serve src --watch

*   Browse [http://local.projmate.com:1080]() which is local

*   Open developer tools (Ctrl+Shift+I or Cmd+Opt+I) -> Sources -> Sources

*   Set break points in coffee files

*   Refresh the page (Ctrl+r or Cmd+r) and voila!


Normally builds are built outside of the `src` directory but source map
support among browsers and IDEs is finicky. The workaround is to build
the generated app.js file into `src` directory.
