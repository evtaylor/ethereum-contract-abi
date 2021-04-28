require 'ethereum-contract-abi/contract'
require 'ethereum-contract-abi'

include EthereumContractABI::ContractInterface

describe EthereumContractABI do
  describe "get_interface" do
    it "should return interface with identifier for erc721" do
      interface = EthereumContractABI.get_interface(EIP::ERC721_METADATA_ID)
      expect(interface).to(be(EIP::ERC721MetadataInterface))
    end

    it "should return interface with identifier for erc1155" do
      interface = EthereumContractABI.get_interface(EIP::ERC1155_METADATA_ID)
      expect(interface).to(be(EIP::ERC1155MetadataInterface))
    end

    it "should return interface with identifier for erc165" do
      interface = EthereumContractABI.get_interface(EIP::ERC165_ID)
      expect(interface).to(be(EIP::ERC165Interface))
    end
  end
end