require 'simplecov'
require 'coveralls'
require 'support/context_helper'

Coveralls.wear! if ENV.include?('TRAVIS')
SimpleCov.start

require 'zmq'
