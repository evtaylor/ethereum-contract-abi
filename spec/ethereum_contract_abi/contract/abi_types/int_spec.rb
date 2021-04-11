require 'contract/abi_types/int'
require 'encoders/int_encoder'

include EthereumContractABI::Encoders
include EthereumContractABI::ContractInterface::AbiTypes

describe EthereumContractABI::ContractInterface::AbiTypes::Int do
  describe "initialize" do
    it "should raise error when invalid number of bits provided" do
      expect{Int.new(7)}.to raise_error(ArgumentError)
    end
  end

  describe "to_s" do
    it "should format type as string" do
      expect(Int.new(8).to_s).to eq("int8")
    end
  end

  describe "encode_value" do
    it "should encode valid int" do
      allow(IntEncoder).to receive(:encode).and_return("encoded data")
      int = Int.new(8)
      result = int.encode_value(100)
      expect(result).to eq("encoded data")
    end

    it "should raise error encoding invalid value" do
      int = Int.new(8)
      expect{int.encode_value('abc')}.to raise_error(ArgumentError)
    end

    it "should raise error encoding invalid value" do
      int = Int.new(8)
      expect{int.encode_value(-257)}.to raise_error(ArgumentError)
    end
  end

  describe "from_string" do
    it "should return false when not valid uint string" do
      expect(Int.from_string("bool")).to eq(nil)
      expect(Int.from_string("uint")).to eq(nil)
      expect(Int.from_string("uint256")).to eq(nil)
      expect(Int.from_string("bytes")).to eq(nil)
    end

    it "should new instance for valid type string " do
      type = Int.from_string("int128")
      expect(type).to_not eq(nil)
      expect(type.to_s).to eq("int128")
    end

    it "should default to int256 if uint" do
      type = Int.from_string("int")
      expect(type.to_s).to eq("int256")
    end
  end
end