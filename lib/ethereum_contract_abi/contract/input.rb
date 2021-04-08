module EthereumContractABI
  module ContractInterface
    class Input
      def initialize(type, name)
        @name = name
        @type = type
      end
    end
  end
end