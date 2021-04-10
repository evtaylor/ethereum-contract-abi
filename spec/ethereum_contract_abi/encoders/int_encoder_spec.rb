require 'encoders/int_encoder'
require 'util'

describe EthereumContractABI::Encoders::IntEncoder do
  describe "encode" do
    it "encodes basic integer" do
      expected = "0000000000000000000000000000000000000000000000000000000000000045"
      expected_hex = EthereumContractABI::Util.strToEscapedHex(expected)
      result = EthereumContractABI::Encoders::IntEncoder.encode(69)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end

    it "encodes negative integer" do
      expected = "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
      expected_hex = EthereumContractABI::Util.strToEscapedHex(expected)
      result = EthereumContractABI::Encoders::IntEncoder.encode(-1)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end

    it "encodes negative 2 digit integer" do
      expected = "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B"
      expected_hex = EthereumContractABI::Util.strToEscapedHex(expected)
      result = EthereumContractABI::Encoders::IntEncoder.encode(-101)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end

    it "encodes basic integer" do
      expected = "0000000000000000000000000000000000000000000000000000000000000064"
      expected_hex = EthereumContractABI::Util.strToEscapedHex(expected)
      result = EthereumContractABI::Encoders::IntEncoder.encode(100)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end
  end
end