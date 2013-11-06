require 'spec_helper'

module ZMQ
  describe Proxy do
    context_helper = ContextHelper.new

    let :context do
      context_helper.create_context
    end

    let :frontend do
      context.socket(:router)
    end

    let :backend do
      context.socket(:dealer)
    end

    let! :proxy do
      described_class.new(frontend, backend)
    end

    describe '#start' do
      it 'closes frontend and backend sockets on termination' do
        context_helper.destroy
        proxy.start
        [frontend, backend].each do |socket|
          expect { socket.close }.to raise_error(Errno::ENOTSOCK)
        end
        context_helper.await_destruction
      end

      it 'is possible to send messages through proxy' do
        proxy_thread = Thread.new { proxy.start }
        frontend.bind('inproc://frontend')
        backend.bind('inproc://backend')
        client = context.socket(:req).tap { |s| s.connect(frontend.getsockopt(:last_endpoint)) }
        server = context.socket(:rep).tap { |s| s.connect(backend.getsockopt(:last_endpoint)) }
        request = Message.new('hello')
        request.send(client)
        request.recv(server)
        request.data.should == 'hello'
        reply = Message.new('world')
        reply.send(server)
        reply.recv(client)
        reply.data.should == 'world'
        [client, server, request, reply].each(&:close)
        # If context destruction is run in main thread and proxy
        # thread joins before context is destroyed, Context#destroy
        # will raise Errno::EINTR.
        context_helper.destroy
        context_helper.await_destruction
        proxy_thread.join
      end
    end
  end
end

