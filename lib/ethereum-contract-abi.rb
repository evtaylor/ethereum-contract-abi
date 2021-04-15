require 'bundler/setup'
require 'ethereum-contract-abi/contract/parsers/contract_parser'

module EthereumContractABI
  def contract_from_json(json_string)
    ContractParser.from_json(json_string)
  end
end