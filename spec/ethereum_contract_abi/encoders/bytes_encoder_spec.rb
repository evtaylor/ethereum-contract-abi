require 'encoders/bytes_encoder'
require 'util'

describe EthereumContractABI::Encoders::BytesEncoder do
  describe "encode" do
    it "encodes 1 byte" do
      expected = "\xAB" + EthereumContractABI::Constants::BYTE_ZERO * 31
      result = EthereumContractABI::Encoders::BytesEncoder.encode("\xab")

      expect(result).to eq(expected)
      expect(result.bytesize).to eq(32)
    end

    it "encodes string bytes" do
      expected = "6461766500000000000000000000000000000000000000000000000000000000"
      expected_hex = EthereumContractABI::Util.strToEscapedHex(expected)
      result = EthereumContractABI::Encoders::BytesEncoder.encode("dave")
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end

    it "encodes string bytes longer than 32 bytes" do
      expected = "6162636465666768696a6b6c6d6e6f707172737475767778797a313233343536"
      expected += "3738393000000000000000000000000000000000000000000000000000000000"
      expected_hex = EthereumContractABI::Util.strToEscapedHex(expected)
      result = EthereumContractABI::Encoders::BytesEncoder.encode("abcdefghijklmnopqrstuvwxyz1234567890")
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(64)
    end
  end
end