require 'json'
require 'contract'
require 'contract/input'
require 'contract/output'
require 'contract/parsers/abi_type_parser'
require 'contract/function'

include EthereumContractABI::ContractInterface

module EthereumContractABI
  module ContractInterface
    module Parsers
      class FunctionParser
        def self.from_hash(function_hash)
          name = function_hash[:name]
          inputs = self.get_inputs(function_hash[:inputs])
          outputs = self.get_inputs(function_hash[:outputs])
          Function.new(name, inputs, outputs)
        end

        private

        def self.get_inputs(inputs)
          inputs.map do |input_hash|
            hash = input_hash.transform_keys(&:to_sym)
            type = AbiTypeParser.from_string(hash[:type])
            Input.new(name, type)
          end
        end

        def self.get_outputs(outputs)
          outputs.map do |input_hash|
            hash = input_hash.transform_keys(&:to_sym)
            type = AbiTypeParser.from_string(hash[:type])
            Output.new(name, type)
          end
        end
      end
    end
  end
end