require 'ethereum-contract-abi/contract/eip/erc165_interface'
require 'ethereum-contract-abi/contract'
require 'ethereum-contract-abi/contract/parsers/function_parser'

include EthereumContractABI::Encoders
include EthereumContractABI::ContractInterface

describe EthereumContractABI::ContractInterface::EIP::ERC165Interface do
  describe "is_implemented?" do
    it "should return false when contract does not implement" do
      contract = EthereumContractABI::Contract.new([], [])
      expect(EIP::ERC165Interface.is_implemented_by?(contract)).to(eq(false))
    end

    it "should return true when contract implements erc1155 metadata" do
      erc165_json = File.read(FIXTURES + '/interfaces/erc165.json')
      functions = JSON.parse(erc165_json).map{ |fhash| Parsers::FunctionParser.from_hash(fhash)}
      contract = EthereumContractABI::Contract.new(functions, [])
      expect(EIP::ERC165Interface.is_implemented_by?(contract)).to(eq(true))
    end
  end
end