require_relative '../constants'

module EthereumContractABI
  module Encoders
    class BytesEncoder
      def self.encode(bytes)
        bytes + Constants::BYTE_ZERO * (32 - bytes.bytesize)
      end
    end
  end
end