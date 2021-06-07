require 'ethereum-contract-abi/util'
require 'ethereum-contract-abi/encoders/int_encoder'

module EthereumContractABI
  module Encoders
    class FunctionEncoder
      def initialize(function_inputs)
        @function_inputs = function_inputs
      end

      def encode_dynamic_input(input_values)
        tail = encode_tail(input_values)
        tail_offsets = get_tail_offsets(input_values)
        head = @function_inputs.zip(input_values).map do |input, arg|
          if !input.type.is_dynamic
            input.encode_value(arg)
          else
            EthereumContractABI::Encoders::IntEncoder.encode(tail_offsets.shift)
          end
        end
        head.join('') + tail.join('')
      end

      def encode_static_input(input_values)
        @function_inputs.zip(input_values).map do |input, arg|
          input.encode_value(arg)
        end.join('')
      end

      private

      def head_length_in_bytes
        @function_inputs.size * 32
      end

      def get_tail_offsets(input_values)
        offset = head_length_in_bytes
        encode_tail(input_values).map do |item|
          item_offset = offset
          offset += item.bytesize
          item_offset
        end
      end

      def encode_tail(input_values)
        @function_inputs.zip(input_values).map do |input, arg|
          return unless input.type.is_dynamic
          input.encode_value(arg)
        end
      end
    end
  end
end