require 'json'
require 'contract'
require 'contract/parsers/function_parser'

include EthereumContractABI::ContractInterface::Parsers

module EthereumContractABI
  module ContractInterface
    module Parsers
      class ContractParser
        def self.from_json(json_string)
          parsed = JSON.parse(json_string)
          functions = parsed.select { |interface| interface["type"] === "function"}
                            .map { |f_hash| f_hash.transform_keys(&:to_sym) }
                            .map { |f_hash| FunctionParser.from_hash(f_hash) }
          events = parsed.select { |interface| interface["type"] === "event"}
          EthereumContractABI::Contract.new(functions, events)
        end
      end
    end
  end
end