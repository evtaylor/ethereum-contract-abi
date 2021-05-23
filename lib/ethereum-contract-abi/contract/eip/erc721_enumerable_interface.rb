require 'ethereum-contract-abi/contract/abi_types/address'
require 'ethereum-contract-abi/contract/abi_types/uint'
require 'ethereum-contract-abi/contract/output'
require 'ethereum-contract-abi/contract/function'

include EthereumContractABI::ContractInterface

module EthereumContractABI
  module ContractInterface
    module EIP
      class ERC721EnumerableInterface

        def self.is_implemented_by?(contract)
          contract.has_function?(self.totalSupply) &&
            contract.has_function?(self.tokenByIndex) &&
            contract.has_function?(self.tokenOfOwnerByIndex)
        end

        def self.totalSupply
          function_name = 'totalSupply'
          inputs = []
          outputs = [Output.new(AbiTypes::Uint.new)]
          Function.new(function_name, inputs, outputs)
        end

        def self.tokenByIndex
          function_name = 'tokenByIndex'
          inputs = [Input.new('_index', AbiTypes::Uint.new)]
          outputs = [Output.new(AbiTypes::Uint.new)]
          Function.new(function_name, inputs, outputs)
        end

        def self.tokenOfOwnerByIndex
          function_name = 'tokenOfOwnerByIndex'
          inputs = [Input.new('_owner', AbiTypes::Address.new), Input.new('_index', AbiTypes::Uint.new)]
          outputs = [Output.new(AbiTypes::Uint.new)]
          Function.new(function_name, inputs, outputs)
        end

        def self.functions
          [self.totalSupply, self.tokenByIndex, self.tokenOfOwnerByIndex]
        end
      end
    end
  end
end