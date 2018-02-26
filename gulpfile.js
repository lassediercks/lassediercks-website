var gulp = require("gulp");
var server = require("gulp-server-livereload");

var postcss = require("gulp-postcss");
var cssnext = require("postcss-cssnext");
var cssnano = require("cssnano");
var autoprefixer = require("autoprefixer");
var ejs = require("gulp-ejs");
var watch = require("gulp-watch");
var batch = require("gulp-batch");

gulp.task("webserver", function() {
  gulp.src(".").pipe(
    server({
      livereload: true,
      directoryListing: false,
      open: true
    })
  );
});

gulp.task("css", function() {
  var processors = [
    cssnext({ browsers: ["last 2 version"] }),
    autoprefixer({ browsers: ["last 20 versions"] }),
    cssnano()
  ];
  return gulp
    .src("./style.css")
    .pipe(postcss(processors))
    .pipe(gulp.dest("./dist"));
});
gulp.task("watch", function() {
  watch(
    "style.css",
    batch(function(events, done) {
      gulp.start("css", done);
    })
  );
});

gulp.task("demo", ["watch", "webserver"], function() {});
