require 'json'
require 'ethereum-contract-abi/contract'
require 'ethereum-contract-abi/contract/abi_types/uint'
require 'ethereum-contract-abi/contract/abi_types/bool'
require 'ethereum-contract-abi/contract/abi_types/string'
require 'ethereum-contract-abi/contract/abi_types/fixed'
require 'ethereum-contract-abi/contract/abi_types/bytes'
require 'ethereum-contract-abi/contract/abi_types/address'

include EthereumContractABI::ContractInterface::AbiTypes

module EthereumContractABI
  module ContractInterface
    module Parsers
      class AbiTypeParser
        def self.from_string(string_type)
          uint = Uint.from_string(string_type)
          return uint unless uint.nil?

          bool = Bool.from_string(string_type)
          return bool unless bool.nil?

          decimal = Fixed.from_string(string_type)
          return decimal unless decimal.nil?

          str = EthereumContractABI::ContractInterface::AbiTypes::String.from_string(string_type)
          return str unless str.nil?

          bytes = Bytes.from_string(string_type)
          return bytes unless bytes.nil?

          address = Address.from_string(string_type)
          return address unless address.nil?

          raise ArgumentError.new('Unknown type')
        end
      end
    end
  end
end