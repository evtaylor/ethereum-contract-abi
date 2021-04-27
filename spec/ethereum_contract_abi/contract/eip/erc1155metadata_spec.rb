require 'ethereum-contract-abi/contract/eip/erc1155metadata'
require 'ethereum-contract-abi/contract'
require 'ethereum-contract-abi/contract/parsers/function_parser'

include EthereumContractABI::Encoders
include EthereumContractABI::ContractInterface

describe EthereumContractABI::ContractInterface::EIP::ERC1155Metadata do
  describe "is_implemented?" do
    it "should return false when contract does not implement" do
      contract = EthereumContractABI::Contract.new([], [])
      expect(EIP::ERC1155Metadata.is_implemented_by?(contract)).to(eq(false))
    end

    it "should return true when contract implements erc1155 metadata" do
      erc721_json = File.read(FIXTURES + '/interfaces/erc1155metadata.json')
      functions = JSON.parse(erc721_json).map{ |fhash| Parsers::FunctionParser.from_hash(fhash)}
      contract = EthereumContractABI::Contract.new(functions, [])
      expect(EIP::ERC1155Metadata.is_implemented_by?(contract)).to(eq(true))
    end
  end
end