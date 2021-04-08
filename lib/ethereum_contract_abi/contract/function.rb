module EthereumContractABI
  module ContractInterface
    class Function
      attr_reader :name

      def initialize(name, inputs, outputs)
        @name = name
        @inputs = inputs
        @outputs = outputs
      end

      def valid_args?(*args)
        return false unless args.size === @inputs.size
      end
    end
  end
end