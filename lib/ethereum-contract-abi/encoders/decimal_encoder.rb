require 'ethereum-contract-abi/constants'
require 'ethereum-contract-abi/encoders/int_encoder'

include EthereumContractABI::Encoders

module EthereumContractABI
  module Encoders
    class DecimalEncoder
      def self.encode_value(decimal_number, precision)
        IntEncoder.encode((decimal_number * 10**precision).to_i)
      end
    end
  end
end