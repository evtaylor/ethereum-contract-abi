require 'util'
require 'decoders/int_decoder'
require 'decoders/string_decoder'

module EthereumContractABI
  module Decoders
    class FunctionDecoder
      def initialize(function_outputs)
        @function_outputs = function_outputs
      end

      def decode_dynamic_output(encoded_output)
        hex = Util.toHexByteString(encoded_output)
        @function_outputs.map.with_index  do |output, index|
          head = get_head_by_index(encoded_output, index)
          head_offset = IntDecoder.decode(head)
          output_bytes = hex.byteslice(head_offset, hex.bytesize)
          output.type.decode_value(Util.fromHexByteString(output_bytes))
        end
      end

      def decode_static_output(encoded_output)

      end

      private

      def get_head_by_index(encoded_output, index)
        first_byte = index * 64
        encoded_output.byteslice(first_byte, 64)
      end
    end
  end
end