require_relative './int'

module EthereumContractABI
  module Types
    class Bool
      def self.encode(boolVal)
        boolVal ? EthereumContractABI::Types::Int.encode(1) : EthereumContractABI::Types::Int.encode(0)
      end
    end
  end
end