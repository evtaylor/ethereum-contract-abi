require 'contract/solidity_types/uint'
require 'encoders/int_encoder'

include EthereumContractABI::Encoders
include EthereumContractABI::ContractInterface::SolidityTypes

describe EthereumContractABI::ContractInterface::SolidityTypes::Uint do
  describe "initialize" do
    it "should raise error when invalid number of bits provided" do
      expect{Uint.new(7)}.to raise_error(ArgumentError)
    end
  end

  describe "encode_value" do
    it "should encode valid int" do
      allow(IntEncoder).to receive(:encode).and_return("encoded data")
      uint = Uint.new(8)
      result = uint.encode_value(100)
      expect(result).to eq("encoded data")
    end

    it "should raise error encoding invalid value" do
      uint = Uint.new(8)
      expect{uint.encode_value('abc')}.to raise_error(ArgumentError)
    end

    it "should raise error encoding invalid value" do
      uint = Uint.new(8)
      expect{uint.encode_value(256)}.to raise_error(ArgumentError)
    end
  end
end