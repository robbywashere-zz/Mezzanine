gulp = require 'gulp'

$require = require 'rekuire'

$config = $require 'config/config'


path = require 'path'

$js_write = -> gulp.dest path.join($config.output.root, $config.output.assets.js)
$css_write = -> gulp.dest path.join($config.output.root, $config.output.assets.css)

browserify = require 'browserify'

coffee = require 'gulp-coffee'

through = require 'through2'

gutil = require 'gulp-util'

sourcemaps = require 'gulp-sourcemaps'

del = require 'del'

$print = through.obj (file,enc,cb) -> console.log file.contents.toString()

$error = (err) -> gutil.log err

$bfy = through.obj (file,enc,cb) ->
  browserify file
  .bundle (err,src) =>
 	  if err
      @emit 'error', err
    else
      file.contents = new Buffer src
      @push file
    do cb




gulp.task 'clean', (cb) ->
  del $config.output.root, cb

gulp.task 'default', ['clean'], ->
  gulp.start 'scripts'


gulp.task 'scripts', ->
  gulp.start 'compile:coffee'


gulp.task 'compile:coffee', ->
  gulp.src $config.input.coffee
  .pipe do sourcemaps.init
  .pipe coffee(bare: true).on('error', $error)
  .pipe $bfy
  .on 'error', (err) ->
    gutil.log err
  .pipe do sourcemaps.write
  .pipe $print
  .pipe do $js_write

  


gulp.task "auto-reload", ->
  spawnChildren = (e) ->
    
    # kill previous spawned process
    p.kill()  if p
    
    # `spawn` a child `gulp` process linked to the parent `stdio`
    p = spawn("gulp",
      stdio: "inherit"
    )
    return
  p = undefined
  gulp.watch "gulpfile.coffee", spawnChildren
  spawnChildren()
  return

