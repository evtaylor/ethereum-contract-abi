require 'contract/abi_types/uint'
require 'encoders/int_encoder'

include EthereumContractABI::Encoders
include EthereumContractABI::ContractInterface::AbiTypes

describe EthereumContractABI::ContractInterface::AbiTypes::Uint do
  describe "initialize" do
    it "should raise error when invalid number of bits provided" do
      expect{Uint.new(7)}.to raise_error(ArgumentError)
    end
  end

  describe "to_s" do
    it "should format type as string" do
      expect(Uint.new(8).to_s).to eq("uint8")
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

    it "should raise error encoding a negative number" do
      uint = Uint.new(8)
      expect{uint.encode_value(-1)}.to raise_error(ArgumentError)
    end

    it "should raise error encoding invalid value" do
      uint = Uint.new(8)
      expect{uint.encode_value(256)}.to raise_error(ArgumentError)
    end
  end

  describe "from_string" do
    it "should return false when not valid uint string" do
      expect(Uint.from_string("bool")).to eq(nil)
      expect(Uint.from_string("int")).to eq(nil)
      expect(Uint.from_string("int256")).to eq(nil)
      expect(Uint.from_string("bytes")).to eq(nil)
    end

    it "should new instance for valid type string " do
      type = Uint.from_string("uint128")
      expect(type).to_not eq(nil)
      expect(type.to_s).to eq("uint128")
    end

    it "should default to uint256 if uint" do
      type = Uint.from_string("uint")
      expect(type.to_s).to eq("uint256")
    end
  end
end