require 'ethereum-contract-abi/contract/abi_types/bytes'
require 'ethereum-contract-abi/contract/abi_types/bool'
require 'ethereum-contract-abi/contract/output'
require 'ethereum-contract-abi/contract/function'

include EthereumContractABI::ContractInterface

module EthereumContractABI
  module ContractInterface
    module EIP
      class ERC165Interface

        def self.is_implemented_by?(contract)
          contract.has_function?(self.supportsInterface)
        end

        def self.functions
          [self.supportsInterface]
        end

        def self.supportsInterface
          function_name = 'supportsInterface'
          inputs = [Input.new( 'interfaceID', AbiTypes::Bytes.new(4))]
          outputs = [Output.new(AbiTypes::Bool.new)]
          Function.new(function_name, inputs, outputs)
        end
      end
    end
  end
end