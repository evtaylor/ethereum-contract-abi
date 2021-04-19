require 'digest'
require 'openssl'
require 'sha3-pure-ruby'
require 'ethereum-contract-abi/util'
require 'ethereum-contract-abi/decoders/function_decoder'

include EthereumContractABI::Decoders

module EthereumContractABI
  module ContractInterface
    class Function
      attr_reader :name, :inputs, :outputs

      def initialize(name, inputs, outputs)
        @name = name
        @inputs = inputs
        @outputs = outputs
        @decoder = FunctionDecoder.new(outputs)
      end

      def signature
        params = @inputs.map { |i| i.type.to_s }
        "#{@name}(#{params.join(",")})"
      end

      def method_id
        hash = [Digest::SHA3.new(256, true).hexdigest(signature)].pack("H*")
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

      def decode_output(output_string)
        if has_any_dynamic_outputs
          @decoder.decode_dynamic_output(output_string)
        else
          @decoder.decode_static_output(output_string)
        end
      end

      private

      def has_any_dynamic_outputs
        @outputs.find { |o| o.type.is_dynamic }
      end
    end
  end
end