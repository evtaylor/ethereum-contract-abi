require 'ethereum-contract-abi/util'
require 'ethereum-contract-abi/decoders/int_decoder'

include EthereumContractABI::Decoders

module EthereumContractABI
  module Decoders
    class StringDecoder
      def self.decode(string, num_bytes = nil)
        hex = [string].pack('H*')
        length = IntDecoder.decode(hex.byteslice(0, 32).unpack("H*").first)
        hex.byteslice(32..hex.bytesize).byteslice(0, length)
      end
    end
  end
end