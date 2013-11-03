require 'simplecov'
require 'coveralls'

Coveralls.wear! if ENV.include?('TRAVIS')
SimpleCov.start

require 'zmq'
