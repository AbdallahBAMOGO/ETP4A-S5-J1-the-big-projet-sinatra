require 'bundler'
  Bundler .require
  $LOAD_PATH.unshift File.expand_path('./lib', __FILE__)
  require './lib/controller'
  run ApplicationController