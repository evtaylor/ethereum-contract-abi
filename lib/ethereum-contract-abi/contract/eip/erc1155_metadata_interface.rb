require 'ethereum-contract-abi/contract/abi_types/string'
require 'ethereum-contract-abi/contract/abi_types/uint'
require 'ethereum-contract-abi/contract/output'
require 'ethereum-contract-abi/contract/function'

include EthereumContractABI::ContractInterface

module EthereumContractABI
  module ContractInterface
    module EIP
      class ERC1155MetadataInterface

        def self.is_implemented_by?(contract)
          contract.has_function?(self.uri)
        end

        def self.functions
          [self.uri]
        end

        def self.uri
          function_name = 'uri'
          inputs = [Input.new('_id', AbiTypes::Uint.new)]
          outputs = [Output.new(AbiTypes::String.new)]
          Function.new(function_name, inputs, outputs)
        end
      end
    end
  end
end