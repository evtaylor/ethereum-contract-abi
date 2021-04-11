require 'contract/abi_types/fixed'
require 'encoders/int_encoder'

include EthereumContractABI::Encoders
include EthereumContractABI::ContractInterface::AbiTypes

describe EthereumContractABI::ContractInterface::AbiTypes::Fixed do
  describe "initialize" do
    it "should raise error when invalid number of bits provided" do
      expect{Fixed.new(7, 10)}.to raise_error(ArgumentError)
    end
  end

  describe "to_s" do
    it "should format type as string" do
      expect(Fixed.new(8, 10).to_s).to eq("fixed8x10")
    end
  end

  describe "encode_value" do
    it "should encode valid fixed decimal" do
      allow(IntEncoder).to receive(:encode).and_return("encoded data")
      decimal = Fixed.new(8, 10)
      result = decimal.encode_value(100.0001)
      expect(result).to eq("encoded data")
    end

    it "should raise error encoding invalid value" do
      decimal = Fixed.new(8, 10)
      expect{decimal.encode_value('abc')}.to raise_error(ArgumentError)
    end

    it "should raise error encoding invalid value" do
      decimal = Fixed.new(8, 10)
      expect{decimal.encode_value(256)}.to raise_error(ArgumentError)
    end
  end

  describe "from_string" do
    it "should return false when not valid uint string" do
      expect(Fixed.from_string("bool")).to eq(nil)
      expect(Fixed.from_string("int")).to eq(nil)
      expect(Fixed.from_string("int256")).to eq(nil)
      expect(Fixed.from_string("bytes")).to eq(nil)
    end

    it "should new instance for valid type string " do
      type = Fixed.from_string("fixed256x8")
      expect(type).to_not eq(nil)
      expect(type.to_s).to eq("fixed256x8")
    end

    it "should default to fixed128x18 if uint" do
      type = Fixed.from_string("fixed")
      expect(type.to_s).to eq("fixed128x18")
    end
  end
end