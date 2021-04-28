require 'ethereum-contract-abi/contract/input'
require 'ethereum-contract-abi/contract/abi_types/uint'
require 'ethereum-contract-abi/encoders/int_encoder'
require 'ethereum-contract-abi/contract/eip/erc721_metadata_interface'
require 'ethereum-contract-abi/contract'
require 'ethereum-contract-abi/contract/parsers/function_parser'

include EthereumContractABI::Encoders
include EthereumContractABI::ContractInterface

describe EthereumContractABI::ContractInterface::EIP::ERC721MetadataInterface do
  describe "is_implemented?" do
    it "should return false when contract does not implement" do
      contract = EthereumContractABI::Contract.new([], [])
      expect(EIP::ERC721MetadataInterface.is_implemented_by?(contract)).to(eq(false))
    end

    it "should return true when contract implements erc721 metadata" do
      erc721_json = File.read(FIXTURES + '/interfaces/erc721metadata.json')
      functions = JSON.parse(erc721_json).map{ |fhash| Parsers::FunctionParser.from_hash(fhash)}
      contract = EthereumContractABI::Contract.new(functions, [])
      expect(EIP::ERC721MetadataInterface.is_implemented_by?(contract)).to(eq(true))
    end
  end
end