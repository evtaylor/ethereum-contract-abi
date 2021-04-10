require 'json'
require 'contract'
require 'contract/input'
require 'contract/output'

module EthereumContractABI
  module ContractInterface
    module Parsers
      class FunctionParser
        def self.from_hash(function_hash)
          p
          name = function_hash["name"]
          inputs = self.get_inputs(function_hash[:inputs])
          outputs = self.get_inputs(function_hash[:outputs])
          Function.new(name, inputs, outputs)
        end

        private

        def self.get_inputs(inputs)
          inputs.map do |input_hash|
            type = input_hash["type"]
            Input.new(name, type)
          end
        end

        def self.get_outputs(outputs)
          outputs.map do |input_hash|
            type = input_hash["type"]
            Output.new(name, type)
          end
        end
      end
    end
  end
end