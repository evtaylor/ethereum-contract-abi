require 'json'
require 'contract'

module EthereumContractABI
  module ContractInterface
    module Parsers
      class ContractParser
        def self.from_json(json_string)
          parsed = JSON.parse(json_string)
          functions = parsed.select { |interface| interface["type"] === "function"}
          events = parsed.select { |interface| interface["type"] === "event"}
          EthereumContractABI::Contract.new(functions, events)
        end
      end
    end
  end
end