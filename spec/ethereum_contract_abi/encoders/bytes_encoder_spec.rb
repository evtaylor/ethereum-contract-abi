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

    it "encodes more than 32 byte" do
      expected = "6461766500000000000000000000000000000000000000000000000000000000"
      expected_hex = EthereumContractABI::Util.strToEscapedHex(expected)
      result = EthereumContractABI::Encoders::BytesEncoder.encode("dave")
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end
  end
end