fcompress
===

[`clean-css`](https://github.com/jakubpawlowicz/clean-css) and [`uglify-js`](https://github.com/mishoo/UglifyJS2) bundled into a single executable for Windows.

#### Why

- Need to minify static files for project.
- Most good minifiers are written in Node.js.
- Did not install Node.js.
- [Its fun bundling stuff up](https://github.com/altbdoor/jekyll-exe).

#### Building

The steps are in the `appveyor.yml`'s `build_script` section. In short:

1. `npm install` your dependencies. (I recommend `npm@3` for its flat dependency structure.)
1. Get the latest stable `node.exe` Windows binary.
1. Use 7-Zip to compress the `.bat`, `node.exe` and `node_modules` into an archive.
1. Create a self-extracting archive which executes the `.bat` file.

#### Downloads

Latest build can be found in [AppVeyor](https://ci.appveyor.com/project/altbdoor/fcompress/build/artifacts). It is set to rebuild every Sunday midnight (`crontab: 0 0 * * 0`).

#### Credits

Mad props to the people and projects who made this possible. I am just an avid fan of bundling stuff up.

- [Node.js](https://nodejs.org/) and [7-Zip](http://www.7-zip.org/).
- [`clean-css`](https://github.com/jakubpawlowicz/clean-css) and [`uglify-js`](https://github.com/mishoo/UglifyJS2) for the awesome work on minifying static files.
- TumaGonx Zakkum for a [proper 7-Zip SFX](http://opensourcepack.blogspot.com/2013/04/a-simple-bat-to-exe-wrapper.html) that does not spawn a new `cmd` window.
