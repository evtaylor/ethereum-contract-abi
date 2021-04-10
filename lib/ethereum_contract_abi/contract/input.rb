require 'contract/types'
require 'contract/solidity_types/uint'
require 'encoders/int_encoder'

module EthereumContractABI
  module ContractInterface
    include EthereumContractABI::ContractInterface::SolidityTypes

    class Input
      def initialize(name, type)
        @name = name
        @type = type
      end

      def is_valid_input?(value)
        true
      end

      def encode_value(value)
        raise ArgumentError unless is_valid_input?(value)

        case @type.class.name
        when Uint.name
          return IntEncoder.encode(value)
        else
          raise ArgumentError.new("Unsupported type")
        end

      end
    end
  end
end
