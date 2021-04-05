require_relative 'int'

module EthereumContractABI
  module Types
    class FixedPointDecimal
      def self.encode(decimal, precision)
        EthereumContractABI::Types::Int.encode(decimal * 10**precision)
      end
    end
  end
end