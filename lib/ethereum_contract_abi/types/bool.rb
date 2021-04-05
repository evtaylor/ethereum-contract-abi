require_relative './uint'

module EthereumContractABI
  module Types
    class Bool
      def self.encode(boolVal)
        boolVal ? EthereumContractABI::Types::Uint.encode(1) : EthereumContractABI::Types::Uint.encode(0)
      end
    end
  end
end