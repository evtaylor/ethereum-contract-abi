require 'digest'
require 'openssl'
require 'sha3-pure-ruby'

module EthereumContractABI
  module ContractInterface
    class Function
      attr_reader :name

      def initialize(name, inputs, outputs)
        @name = name
        @inputs = inputs
        @outputs = outputs
      end

      def signature
        params = @inputs.map{|i| i.type.to_s}
        "#{@name}(#{params.join(",")})"
      end

      def method_id
        hash = [Digest::SHA3.new(256, true ).hexdigest(signature)].pack("H*")
        hash.slice(0..3)
      end

      def valid_args?(*args)
        return false unless args.size === @inputs.size
      end

      def encode_call(*args)
        method_id
      end
    end
  end
end