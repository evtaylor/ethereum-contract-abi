require 'ethereum-contract-abi/contract/abi_types/string'
require 'ethereum-contract-abi/contract/abi_types/uint'
require 'ethereum-contract-abi/contract/output'
require 'ethereum-contract-abi/contract/function'

include EthereumContractABI::ContractInterface

module EthereumContractABI
  module ContractInterface
    module EIP
      class ERC721Metadata

        def self.is_implemented_by?(contract)
          self.implements_name(contract) &&
            self.implements_symbol(contract) &&
            self.implements_token_uri(contract)
        end

        private

        def self.implements_name(contract)
          function_name = 'name'
          inputs = []
          outputs = [Output.new(AbiTypes::String.new, '_name')]
          contract.has_function?(Function.new(function_name, inputs, outputs))
        end

        def self.implements_symbol(contract)
          function_name = 'symbol'
          inputs = []
          outputs = [Output.new(AbiTypes::String.new, '_symbol')]
          contract.has_function?(Function.new(function_name, inputs, outputs))
        end

        def self.implements_token_uri(contract)
          function_name = 'tokenURI'
          inputs = [Output.new(AbiTypes::Uint.new, '_tokenId')]
          outputs = [Output.new(AbiTypes::String.new)]
          contract.has_function?(Function.new(function_name, inputs, outputs))
        end
      end
    end
  end
end