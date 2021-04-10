require 'contract/parsers/abi_type_parser'
require 'contract/abi_types/uint'

include EthereumContractABI::ContractInterface::Parsers
include EthereumContractABI::ContractInterface::AbiTypes

describe EthereumContractABI::ContractInterface::Parsers::AbiTypeParser do
  describe "from_string" do
    it 'raise error for unknown type' do
      string_type = 'yolo'
      expect{AbiTypeParser.from_string(string_type)}.to raise_error(ArgumentError)
    end

    it 'return instance of valid type' do
      string_type = 'uint128'
      type = AbiTypeParser.from_string(string_type)
      expect(type).to be_a(Uint)
    end
  end
end