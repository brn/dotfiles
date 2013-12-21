/**
 * @fileoverview
 * @author Taketshi Aono
 */

'use strict';
var grunt = require('grunt');
var util = require('util');


exports.info = function() {
  log(arguments, 'INFO', 'green');
};


exports.warn = function() {
  log(arguments, 'WARN', 'yellow');
};


exports.error = function() {
  log(arguments, 'ERROR', 'red');
};


function log(args, name, color) {
  args = Array.prototype.slice.call(args);
  args[0] = (util.format('%s', name) + ' [GRUNT]:')[color] + ' ' + args[0];
  grunt.log.writeln.apply(grunt.log, args);
}