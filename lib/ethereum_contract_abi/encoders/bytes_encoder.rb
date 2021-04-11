require_relative '../constants'

module EthereumContractABI
  module Encoders
    class BytesEncoder
      def self.encode(bytes)
        final_length = (bytes.bytesize / 32.to_f).ceil * 32
        bytes + Constants::BYTE_ZERO * (final_length - bytes.bytesize)
      end
    end
  end
end