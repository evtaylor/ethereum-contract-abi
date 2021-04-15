require 'ethereum-contract-abi/contract/abi_types/bytes'
require 'ethereum-contract-abi/encoders/bytes_encoder'

include EthereumContractABI::Encoders
include EthereumContractABI::ContractInterface::AbiTypes

describe EthereumContractABI::ContractInterface::AbiTypes::Bytes do

  describe "to_s" do
    it "should format type as string" do
      expect(Bytes.new(8).to_s).to eq("bytes8")
    end
  end

  describe "encode_value" do
    it "should encode valid int" do
      allow(BytesEncoder).to receive(:encode).and_return("encoded data")
      bytes = Bytes.new(8)
      result = bytes.encode_value("lala")
      expect(result).to eq("encoded data")
    end

    it "should raise error encoding invalid value" do
      bytes = Bytes.new(8)
      expect{bytes.encode_value('123456789')}.to raise_error(ArgumentError)
    end
  end

  describe "from_string" do
    it "should return false when not valid uint string" do
      expect(Bytes.from_string("bool")).to eq(nil)
      expect(Bytes.from_string("uint")).to eq(nil)
      expect(Bytes.from_string("uint256")).to eq(nil)
      expect(Bytes.from_string("fixed")).to eq(nil)
    end

    it "should new instance for valid type string with fixed bytes" do
      type = Bytes.from_string("bytes8")
      expect(type).to_not eq(nil)
      expect(type.to_s).to eq("bytes8")
    end

    it "should new instance for valid type string with fixed 32 bytes " do
      type = Bytes.from_string("bytes32")
      expect(type).to_not eq(nil)
      expect(type.to_s).to eq("bytes32")
    end

    it "should default to dynamic bytes when none given" do
      type = Bytes.from_string("bytes")
      expect(type.to_s).to eq("bytes")
    end
  end
end