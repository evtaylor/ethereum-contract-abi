require 'ethereum-contract-abi/contract/abi_types/string'
require 'ethereum-contract-abi/contract/abi_types/uint'
require 'ethereum-contract-abi/contract/output'
require 'ethereum-contract-abi/contract/function'

include EthereumContractABI::ContractInterface

module EthereumContractABI
  module ContractInterface
    module EIP
      class ERC1155Metadata

        def self.is_implemented_by?(contract)
            self.implements_token_uri(contract)
        end

        private

        def self.implements_token_uri(contract)
          function_name = 'uri'
          inputs = [Output.new(AbiTypes::Uint.new, '_id')]
          outputs = [Output.new(AbiTypes::String.new)]
          contract.has_function?(Function.new(function_name, inputs, outputs))
        end
      end
    end
  end
end