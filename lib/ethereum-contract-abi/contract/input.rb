module EthereumContractABI
  module ContractInterface
    class Input
      attr_reader :type

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
