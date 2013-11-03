# encoding: utf-8

$: << 'lib'

require 'zmq/version'

namespace :release do
  task :tag do
    version_string = "v#{ZMQ::VERSION}"
    unless %x(git tag -l).split("\n").include?(version_string)
      system %(git tag -a #{version_string} -m #{version_string})
    end
    system %(git push && git push --tags)
  end

  task :gem do
    system %(gem build zmq-rb.gemspec && gem push zmq-rb-*.gem && mv zmq-rb-*.gem pkg)
  end
end

task :release => %w[release:tag release:gem]
