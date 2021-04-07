module EthereumContractABI
  module ContractInterface
    class Function
      def initialize(name, inputs, outputs)
        @name = name
        @inputs = inputs
        @outputs = outputs
      end
    end
  end
end