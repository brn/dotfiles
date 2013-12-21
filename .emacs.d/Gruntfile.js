/**
 * @fileoverview
 * @author Taketshi Aono
 */

'use strict';

var pathutil = require('path');
var exec = require('child_process').exec;
var log = require('./log');


module.exports = function(grunt) {

  function proc(command, done) {
    var p = exec(command);
    p.stdout.on('data', function(d) {
      process.stdout.write(d);
    });
    p.stderr.on('data', function(d) {
      process.stderr.write(d);
    });
    p.on('error', function(e) {
      throw e;
    });
    p.on('exit', done);
  }

  var loadPath = grunt.file.expand('./elisps/*').map(function(path) {
        return '-L ' + pathutil.resolve(path).replace(/\\/g, '/');
      }).join(' ');
  var elisps = grunt.file.expand('./elisps/**/*.el');
  var init = grunt.file.expand('./init/*.el');
  var command = 'emacs --batch ' + loadPath +  ' -f batch-byte-compile ';

  log.info('load path : %s', loadPath);

  grunt.registerTask('byte-compile-elisps', '', function() {
    var done = this.async();
    grunt.util.async.forEachSeries(elisps, function(file, next) {
      proc(command + file, function() {
        next();
      });
    }, function() {done()});
  });

  grunt.registerTask('byte-compile-init', '', function() {
    var done = this.async();
    grunt.util.async.forEachSeries(init, function(file, next) {
      proc(command + file, function() {
        next();
      });
    }, function() {
      grunt.file.expand('./init/*.elc').forEach(function(file) {
        var dest = file.replace(/\/init\//, '/init/cmp/');
        grunt.log.writeln('Move %s to %s.', file, dest);
        grunt.file.copy(file, dest);
        grunt.file['delete'](file);
      });
    });
  });

  grunt.registerTask('default', ['byte-compile-elisps', 'byte-compile-init']);
};