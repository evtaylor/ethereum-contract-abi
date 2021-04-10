require 'json'
require 'contract'
require 'contract/abi_types/uint'

include EthereumContractABI::ContractInterface::AbiTypes

module EthereumContractABI
  module ContractInterface
    module Parsers
      class AbiTypeParser
        def self.from_string(string_type)
          is_uint = Uint.from_string(string_type)
          return is_uint unless is_uint.nil?

          raise ArgumentError.new('Unknown type')
        end
      end
    end
  end
end