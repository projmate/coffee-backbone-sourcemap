# coffee-backbone-sourcemap

Projmate CoffeeScript and Backbone + Giraffe example.

* CommonJS in the browser
* Debuggable CoffeeScript scripts and templates via  source maps
* Less CSS
* Handlebars templates with layouts, partials
* Generates static assets, no middleware needed
* Live Reload
* Runs on Linux, Mac and Windows


## Installation

*   Install Projmate build tool

        npm install -g projmate-cli@0.1.0-dev

*   Clone the project

        git clone git://github.com/projmate/coffee-backbone-sourcemap.git


## Debugging

Chrome 27+ works best for debugging with source maps. Older versions did
not reliably stop on breakpoints.

*   From terminal

        cd coffee-backbone-sourcemap
        # serve files and watch w/ livereload
        pm run all --serve --watch

*   Browse [http://local.projmate.com:1080/dist](http://local.projmate.com:1080/dist) which is local.

*   Open developer tools (Ctrl+Shift+I or Cmd+Opt+I) -> Sources -> Sources

*   Set breakpoints in coffee files under `src/app_js`

*   Refresh the page (Ctrl+r or Cmd+r) and voila!


## Production Assets

*   To build and browse production files (minified with headers). Since most
    high performance servers like nginx gzip assets, no compression filter is
    used.

        pm run all -e production --serve


## Having Issues?

It's probably because I am pointing you the edge version of Projmate CLI.
I will lock down an alpha version soon. Make sure you have the latest.

    npm install -g projmate-cli@0.1.0-dev
