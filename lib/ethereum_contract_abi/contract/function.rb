module EthereumContractABI
  module ContractInterface
    class Function
      def initialize(name, inputs, outputs)
        @name = name
        @inputs = inputs
        @outputs = outputs
      end

      def encode_call(*args)
        self.validate_args(args)
      end

      private

      def validate_args(args)

      end
    end
  end
end