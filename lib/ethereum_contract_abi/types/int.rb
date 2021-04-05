require_relative '../constants'

module EthereumContractABI
  module Types
    class Int
      def self.encode(int)
        int_bytes = [int].pack('j>')
        pad_byte = int < 0 ? Constants::BYTE_ONE : Constants::BYTE_ZERO
        pad_byte * (32 - int_bytes.bytesize) + int_bytes
      end
    end
  end
end