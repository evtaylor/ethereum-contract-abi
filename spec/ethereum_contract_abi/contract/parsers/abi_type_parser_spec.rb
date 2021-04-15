require 'ethereum-contract-abi/contract/parsers/abi_type_parser'
require 'ethereum-contract-abi/contract/abi_types/uint'
require 'ethereum-contract-abi/contract/abi_types/bool'

include EthereumContractABI::ContractInterface::Parsers
include EthereumContractABI::ContractInterface::AbiTypes

describe EthereumContractABI::ContractInterface::Parsers::AbiTypeParser do
  describe "from_string" do
    it 'raise error for unknown type' do
      string_type = 'yolo'
      expect{AbiTypeParser.from_string(string_type)}.to raise_error(ArgumentError)
    end

    it 'return instance of valid type uint' do
      string_type = 'uint128'
      type = AbiTypeParser.from_string(string_type)
      expect(type).to be_a(Uint)
    end

    it 'return instance of valid type bool' do
      string_type = 'bool'
      type = AbiTypeParser.from_string(string_type)
      expect(type).to be_a(Bool)
    end
  end
end