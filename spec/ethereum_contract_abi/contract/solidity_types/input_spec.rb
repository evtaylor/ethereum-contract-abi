require 'contract/input'
require 'contract/solidity_types/uint'
require 'encoders/int_encoder'

include EthereumContractABI::Encoders
include EthereumContractABI::ContractInterface

describe EthereumContractABI::ContractInterface::Input do
  describe "encode_value" do
    it 'should return hex encoded value for input' do
      allow(IntEncoder).to receive(:encode).and_return("encoded data")
      input = Input.new('tokenId', SolidityTypes::Uint.new(8))

      result = input.encode_value(100)
      expect(result).to(eq("encoded data"))
    end

    it 'should raise eror on unknown type' do
      input = Input.new('tokenId', "Not a real Type")

      expect{input.encode_value(100)}.to raise_error(ArgumentError)
    end
  end
end