//Defalut Setting
var css_dir = './htdocs/css/';
var scss_dir = './htdocs/scss/';

var gulp = require('gulp');
var sass = require('gulp-sass');
var sourcemaps = require('gulp-sourcemaps');

//gulp-sass
gulp.task('sass', function() {
  gulp.src(scss_dir + '*scss')
    .pipe(sourcemaps.init())
    .pipe(sass({
        style : 'expanded',
    }))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest(css_dir));
});

//watch
gulp.task('default', function () {
    gulp.watch(scss_dir + '*scss', ['sass']);
});
