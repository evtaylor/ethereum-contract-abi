require_relative '../constants'

module EthereumContractABI
  module Types
    class Bytes
      def self.encode(bytes)
        bytes + Constants::BYTE_ZERO * (32 - bytes.bytesize)
      end
    end
  end
end