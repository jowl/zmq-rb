$: << File.expand_path('../lib', __FILE__)

require 'zmq/version'

Gem::Specification.new do |s|
  s.name        = 'zmq-rb'
  s.version     = ZMQ::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Joel Segerlind']
  s.email       = ['joel@kogito.se']
  s.homepage    = 'https://github.com/jowl/zmq-rb'
  s.summary     = 'FFI libzmq bindings'
  s.description = 'Slightly rubyfied ZMQ using FFI'

  s.add_dependency 'ffi'

  s.files         = Dir['lib/**/*.rb']
  s.require_paths = %w[lib]
end
