require 'util'

module EthereumContractABI
  module Decoders
    class IntDecoder
      def self.decode(encoded_value)
        encoded_value.slice(0, 64).to_i(16)
      end
    end
  end
end