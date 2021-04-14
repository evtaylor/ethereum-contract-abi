module EthereumContractABI
  module ContractInterface
    class Output
      attr_reader :type

      def initialize(type, name = nil)
        @name = name
        @type = type
      end

      def decode_value(value)
        @type.decode_value(value)
      end
    end
  end
end