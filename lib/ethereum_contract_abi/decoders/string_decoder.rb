require 'util'

module EthereumContractABI
  module Decoders
    class StringDecoder
      def self.decode(string, num_bytes = nil)
        [string].pack('H*')
      end
    end
  end
end