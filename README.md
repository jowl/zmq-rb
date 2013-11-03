zmq-rb
======
[![Build Status](https://travis-ci.org/jowl/zmq-rb.png)](https://travis-ci.org/jowl/zmq-rb)
[![Coverage Status](https://coveralls.io/repos/jowl/zmq-rb/badge.png)](https://coveralls.io/r/jowl/zmq-rb)

## About

zmq-rb provides FFI bindings for [ZeroMQ](http://zeromq.org/ "ZeroMQ").
Originally, this code resided in
[jowl/bundesstrasse](https://github.com/jowl/bundesstrasse "bundesstrasse"),
but has been extracted since it could be useful on its own. I've tried
to keep it as close to libzmq as possible, while still taking
advantadge of Ruby features. As a result all methods are named after
those in libzmq (even `Socket#send` which might not be Ruby
best-practice).

## Requirements

You must have [libzmq](https://github.com/zeromq/libzmq "libzmq")
(version 3.2 or later) on your path. On OS X, this can be installed
using homebrew; `brew install zmq` (you may need to add the flag
`--universal` to get the path setup properly). If you're on Linux, an
.rpm can be found in the EPEL repo and a .deb in the Ubuntu repo.

## Installation

    gem install zmq-rb

## Usage

API documentation on rubydoc.info coming soon.
