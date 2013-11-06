require 'thread'

class ContextHelper

  attr_reader :context

  def initialize
    @queue = Queue.new
  end

  def create_context
    @context ||= ZMQ::Context.new
  end

  def destroy
    if (ctx = @context)
      Thread.new do
        begin
          ctx.destroy
          @queue << :destroyed
        rescue => e
          @queue << e
        end
      end
      Thread.pass
    else
      @queue << :not_initialized
    end
  end

  def destroy!
    destroy
    await_destruction
  end

  def await_destruction(timeout=1)
    destruction = Thread.new { @queue.pop }.join(timeout)
    @context = nil
    if destruction
      item = destruction.value
      raise item if item.is_a? Exception
    else
      raise "Context destruction timed out"
    end
  end
end
