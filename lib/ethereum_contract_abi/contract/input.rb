module EthereumContractABI
  module ContractInterface
    class Input
      def initialize(name, type)
        @name = name
        @type = type
      end

      def encode_value(value)
        @type.encode_value(value)
      end
    end
  end
end
