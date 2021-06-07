require 'digest'
require 'openssl'
require 'keccak256'
require 'ethereum-contract-abi/util'
require 'ethereum-contract-abi/decoders/function_decoder'
require 'ethereum-contract-abi/encoders/function_encoder'

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
        @encoder = FunctionEncoder.new(inputs)
      end

      def signature
        params = @inputs.map { |i| i.type.to_s }
        "#{@name}(#{params.join(",")})"
      end

      def method_id
        hash = [Digest::Keccak256.new.hexdigest(signature)].pack("H*")
        hash.slice(0..3)
      end

      def valid_args?(args)
        return false unless args.size === @inputs.size
        true
      end

      def encode_call(*args)
        raise ArgumentError.new("Invalid function arguments") unless valid_args?(args)
        if has_any_dynamic_inputs
          encoded_input = @encoder.encode_dynamic_input(args)
        else
          encoded_input = @encoder.encode_static_input(args)
        end
        EthereumContractABI::Util.fromHexByteString(method_id + encoded_input)
      end

      def decode_output(output_string)
        output_hex_string = EthereumContractABI::Util.remove_hex_prefix(output_string)
        if has_any_dynamic_outputs
          @decoder.decode_dynamic_output(output_hex_string)
        else
          @decoder.decode_static_output(output_hex_string)
        end
      end

      private

      def has_any_dynamic_outputs
        @outputs.find { |o| o.type.is_dynamic }
      end

      def has_any_dynamic_inputs
        @inputs.find { |o| o.type.is_dynamic }
      end
    end
  end
end