require 'ethereum-contract-abi/contract/abi_types/string'
require 'ethereum-contract-abi/contract/abi_types/uint'
require 'ethereum-contract-abi/contract/output'
require 'ethereum-contract-abi/contract/function'

include EthereumContractABI::ContractInterface

module EthereumContractABI
  module ContractInterface
    module EIP
      class ERC721MetadataInterface

        def self.is_implemented_by?(contract)
          contract.has_function?(self.name) &&
            contract.has_function?(self.symbol) &&
            contract.has_function?(self.tokenURI)
        end

        def self.name
          function_name = 'name'
          inputs = []
          outputs = [Output.new(AbiTypes::String.new, '_name')]
          Function.new(function_name, inputs, outputs)
        end

        def self.symbol
          function_name = 'symbol'
          inputs = []
          outputs = [Output.new(AbiTypes::String.new, '_symbol')]
          Function.new(function_name, inputs, outputs)
        end

        def self.tokenURI
          function_name = 'tokenURI'
          inputs = [Input.new('_tokenId', AbiTypes::Uint.new)]
          outputs = [Output.new(AbiTypes::String.new)]
          Function.new(function_name, inputs, outputs)
        end

        def self.functions
          [self.name, self.symbol, self.tokenURI]
        end
      end
    end
  end
end