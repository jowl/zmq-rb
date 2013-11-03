module ZMQ
  module SockoptDsl
    Sockopt = Struct.new(:name, :num, :type)

    def sockopt(name, num, type)
      @sockopts ||= Hash.new { |_,k| raise ArgumentError, "Unknown socket option: #{k}" }
      @sockopts[name] = Sockopt.new(name, num, type)
    end

    def sockopts
      @sockopts
    end
  end
end
