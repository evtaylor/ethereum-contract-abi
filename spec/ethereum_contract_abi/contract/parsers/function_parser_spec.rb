require 'ethereum-contract-abi/contract/parsers/function_parser'
require 'ethereum-contract-abi/contract/function'

include EthereumContractABI::ContractInterface
include EthereumContractABI::ContractInterface::Parsers

describe EthereumContractABI::ContractInterface::Parsers::FunctionParser do
  describe "from_hash" do
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
      func = FunctionParser.from_hash(function_hash)
      expect(func).is_a? Function
    end
  end
end