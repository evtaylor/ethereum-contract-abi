require 'ethereum-contract-abi/constants'

module EthereumContractABI
  module Encoders
    class IntEncoder
      def self.encode(int)
        hex = int < 0 ? (int & 0xffff).to_s(16).rjust(2, "0") : int.to_s(16).rjust(2, "0")
        int_hex_bytes = Util.toHexByteString(hex)
        pad_byte = int < 0 ? Constants::BYTE_ONE : Constants::BYTE_ZERO
        pad_byte * (32 - int_hex_bytes.bytesize) + int_hex_bytes
      end
    end
  end
end