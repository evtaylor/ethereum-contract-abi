require 'contract/parsers/function_parser'
require 'contract/function'

include EthereumContractABI::ContractInterface

describe EthereumContractABI::ContractInterface::FunctionParser do
  describe "from json" do
    it 'should parse from hash' do
      function_hash = {
        "inputs":[
          {
            "internalType":"uint256",
            "name":"tokenId",
            "type":"uint256"
          }
        ],
        "name":"tokenURI",
        "outputs":[
          {
            "internalType":"string",
            "name":"",
            "type":"string"
          }
        ],
        "stateMutability":"view",
        "type":"function"
      }
      func = EthereumContractABI::ContractInterface::FunctionParser.from_hash(function_hash)
      expect(func).is_a? Function
    end
  end
end