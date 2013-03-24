# coffee-backbone-sourcemap

Projmate CoffeeScript and Backbone example debuggable through source maps.

* CommonJS in the browser
* CoffeeScript template and scripts
* Less CSS
* DustJs files (layouts, partials)
* Generates static assets, no middleware needed

More documentation is forthcoming for Projmate, which is a GUI project editor
based on likes/dislikes about Jake, Grunt and deploying production sites.
The project is several weekends of effort and the CLI is already useful.

* Builds are based on environments (development, test, production)
* Simple filters and pipelines for asset processing

## Installation

*   Install Projmate build tool

        npm install projmate-cli@0.1.0-dev -g

*   Clone the project

        git clone git://github.com/projmate/coffee-backbone-sourcemap.git


## Debugging

As of this writing, Chrome 26.0.1410.40 beta works well with source maps.
The stable version does not reliably stop on breakpoints.

*   From terminal

        cd coffee-backbone-sourcemap
        pm run all --serve --watch

*   Browse [http://local.projmate.com:1080/dist](http://local.projmate.com:1080/dist) which is local.

*   Open developer tools (Ctrl+Shift+I or Cmd+Opt+I) -> Sources -> Sources

*   Set breakpoints in coffee files

*   Refresh the page (Ctrl+r or Cmd+r) and voila!


## Production Assets

*   To build and browse production files (minified with headers). Since most
    high performance servers like nginx gzip assets, no compression filter is
    used.

        pm run all -e production --serve
