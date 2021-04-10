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

      def valid_args?(args)
        return false unless args.size === @inputs.size
        true
      end

      def encode_call(*args)
        raise ArgumentError.new("Invalid function arguments") unless valid_args?(args)
        encoded_args = @inputs.zip(args).map do |input, arg|
          input.encode_value(arg)
        end
        method_id + encoded_args.join('')
      end
    end
  end
end