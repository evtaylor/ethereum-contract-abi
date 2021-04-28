require 'bundler/setup'
require 'ethereum-contract-abi/contract/parsers/contract_parser'
require 'ethereum-contract-abi/contract/eip/erc165_interface'
require 'ethereum-contract-abi/contract/eip/erc721_metadata_interface'
require 'ethereum-contract-abi/contract/eip/erc1155_metadata_interface'

module EthereumContractABI
  def self.contract_from_json(json_string)
    ContractParser.from_json(json_string)
  end

  def self.get_interface(interface_id)
    case interface_id
    when EIP::ERC721_METADATA_ID
      EIP::ERC721MetadataInterface
    when EIP::ERC1155_METADATA_ID
      EIP::ERC1155MetadataInterface
    when EIP::ERC165_ID
      EIP::ERC165Interface
    else
      raise ArgumentError.new('Unknown interface identifier')
    end
  end
end