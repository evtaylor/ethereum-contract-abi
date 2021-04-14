require 'encoders/int_encoder'
require 'contract/abi_types/uint'

include EthereumContractABI::Encoders
include EthereumContractABI::ContractInterface::AbiTypes

module EthereumContractABI
  module ContractInterface
    module AbiTypes
      class Address < Uint
        def initialize
          super(160)
        end

        def is_dynamic
          false
        end

        def to_s
          "address"
        end

        def self.from_string(string_type)
          string_type === 'address' ? self.new : nil
        end
      end
    end
  end
end