require 'encoders/bytes_encoder'
require 'util'

describe EthereumContractABI::Encoders::BytesEncoder do
  describe "encode" do
    it "encodes 1 byte" do
      expected = "\xAB" + EthereumContractABI::Constants::BYTE_ZERO * 31
      result = EthereumContractABI::Encoders::BytesEncoder.encode("\xab", 16)

      expect(result).to eq(expected)
      expect(result.bytesize).to eq(32)
    end

    it "encodes string bytes" do
      expected = "6461766500000000000000000000000000000000000000000000000000000000"
      expected_hex = EthereumContractABI::Util.toHexByteString(expected)
      result = EthereumContractABI::Encoders::BytesEncoder.encode("dave", 16)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end

    it "encodes string bytes longer than 32 bytes" do
      expected = "6162636465666768696a6b6c6d6e6f707172737475767778797a313233343536"
      expected += "3738393000000000000000000000000000000000000000000000000000000000"
      expected_hex = EthereumContractABI::Util.toHexByteString(expected)
      result = EthereumContractABI::Encoders::BytesEncoder.encode("abcdefghijklmnopqrstuvwxyz1234567890", 64)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(64)
    end

    it "encodes long string with special characters" do
      expected = "000000000000000000000000000000000000000000000000000000000000002c68747470733a2f2f6d6574612e706f6c6b616d6f6e2e636f6d2f6d6574613f69643d313030303033363534310000000000000000000000000000000000000000"
      expected_hex = EthereumContractABI::Util.toHexByteString(expected)
      str = "https://meta.polkamon.com/meta?id=1000036541"
      result = EthereumContractABI::Encoders::BytesEncoder.encode(str)
      expect(result).to eq(expected_hex)
    end
  end
end