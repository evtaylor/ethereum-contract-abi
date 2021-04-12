require 'util'

module EthereumContractABI
  module Decoders
    class StringDecoder
      def self.decode(string, num_bytes = nil)
        hex = [string].pack('H*')
        length = hex.byteslice(0..31)
        # decode length
      end
    end
  end
end