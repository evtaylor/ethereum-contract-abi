require 'encoders/int_encoder'
require 'contract/abi_types/uint'

include EthereumContractABI::Encoders
include EthereumContractABI::ContractInterface::AbiTypes

module EthereumContractABI
  module ContractInterface
    module AbiTypes
      class Address < Uint

        def to_s
          "address"
        end

        def self.from_string(string_type)
          string_type === 'address' ? Uint.new(160) : nil
        end
      end
    end
  end
end