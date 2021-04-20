require 'ethereum-contract-abi/contract/eip/constants'
require 'ethereum-contract-abi/contract/eip/erc721metadata'

include EthereumContractABI::ContractInterface

module EthereumContractABI
  class Contract
    def initialize(functions, events)
      @functions = functions.to_h { |func| [func.name, func]}
      @events = events
    end

    def functions
      @functions.values
    end

    def function(name)
      @functions.dig(name)
    end

    def function_exists?(name)
      @functions.key? name
    end

    def implements_interface(identifier)
      case identifier
      when EIP::ERC721_METADATA
        EIP::ERC721Metadata.is_implemented_by?(self)
      else
        raise ArgumentError.new('Unknown interface identifier')
      end
    end

    def has_function?(func)
      return false unless function_exists?(func.name)
      contract_func = function(func.name)
      return false unless contract_func.inputs.size == func.inputs.size
      return false unless contract_func.outputs.size == func.outputs.size

      input_type_strings = contract_func.inputs.map {|i| i.type.to_s }
      expected_input_type_strings = func.inputs.map {|i| i.type.to_s }
      output_type_string = contract_func.outputs.map {|i| i.type.to_s }
      expected_output_type_string = func.outputs.map {|i| i.type.to_s }

      Set.new(expected_input_type_strings) == Set.new(input_type_strings) &&
        Set.new(expected_output_type_string) == Set.new(output_type_string)
    end
  end
end