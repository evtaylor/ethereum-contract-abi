require 'constants'
require 'encoders/int_encoder'

include EthereumContractABI::Encoders

module EthereumContractABI
  module Encoders
    class DecimalEncoder
      def self.encode(decimal_number, precision)
        IntEncoder.encode(decimal_number * 10**precision)
      end
    end
  end
end