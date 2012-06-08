#!/usr/bin/env rake
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require "bundler/gem_tasks"
Bundler.setup
Bundler.require
require 'bubble-wrap/test'

task :headless_spec do
  sh "macbacon -a"
end

Motion::Project::App.setup do |app|
  app.name = 'midiTestSuite'
  app.identifier = 'io.bubblewrap.midiTestSuite'
end
