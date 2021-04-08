module EthereumContractABI
  module ContractInterface
    class Output
      def initialize(type, name)
        @name = name
        @type = type
      end
    end
  end
end