require 'ethereum-contract-abi/constants'
require 'ethereum-contract-abi/encoders/int_encoder'

include EthereumContractABI::Encoders

module EthereumContractABI
  module Encoders
    class BytesEncoder
      def self.encode(bytes_to_encode, num_bytes = nil)
        if bytes_to_encode.methods.include?(:start_with?) && bytes_to_encode.start_with?("0x")
          bytes_to_encode = Util.toHexByteString(bytes_to_encode.slice(2, bytes_to_encode.length))
        end

        unless num_bytes.nil?
          raise ArgumentError.new("Too many bytes to encode") unless bytes_to_encode.bytesize <= num_bytes
          return self.encode_bytes(bytes_to_encode)
        end

        num_bytes_encoded = IntEncoder.encode(bytes_to_encode.bytesize)
        num_bytes_encoded + self.encode_bytes(bytes_to_encode)
      end

      private

      def self.encode_bytes(bytes_to_encode)
        final_length = (bytes_to_encode.bytesize / 32.to_f).ceil * 32
        bytes_to_encode + Constants::BYTE_ZERO * (final_length - bytes_to_encode.bytesize)
      end
    end
  end
end