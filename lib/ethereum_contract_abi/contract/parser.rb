require 'json'

module EthereumContractABI
  module ContractInterface
    class Parser
      def self.from_json(json_string)
        parsed = JSON.parse(json_string)
        functions = parsed.select { |interface| interface["type"] === "function"}
        events = parsed.select { |interface| interface["type"] === "event"}
        EthereumContractABI::Contract.new(functions, events)
      end
    end
  end
end