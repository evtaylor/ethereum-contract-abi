require 'util'

module EthereumContractABI
  module Decoders
    class IntDecoder
      def self.decode(encoded_value)
        [string].pack('H*')
      end
    end
  end
end