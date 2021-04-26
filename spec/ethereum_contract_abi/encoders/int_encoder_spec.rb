require 'ethereum-contract-abi/encoders/int_encoder'
require 'ethereum-contract-abi/util'

describe EthereumContractABI::Encoders::IntEncoder do
  describe "encode" do
    it "encodes 1" do
      expected = "0000000000000000000000000000000000000000000000000000000000000001"
      expected_hex = EthereumContractABI::Util.toHexByteString(expected)
      result = EthereumContractABI::Encoders::IntEncoder.encode(1)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end

    it "encodes 0" do
      expected = "0000000000000000000000000000000000000000000000000000000000000000"
      expected_hex = EthereumContractABI::Util.toHexByteString(expected)
      result = EthereumContractABI::Encoders::IntEncoder.encode(0)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end

    it "encodes basic integer" do
      expected = "0000000000000000000000000000000000000000000000000000000000000045"
      expected_hex = EthereumContractABI::Util.toHexByteString(expected)
      result = EthereumContractABI::Encoders::IntEncoder.encode(69)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end

    it "encodes int ending in 255" do
      expected = "000000000000000000000000000000000000000000000000000000000001608F"
      expected_hex = EthereumContractABI::Util.toHexByteString(expected)
      result = EthereumContractABI::Encoders::IntEncoder.encode(90255)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end

    it "encodes negative integer" do
      expected = "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
      expected_hex = EthereumContractABI::Util.toHexByteString(expected)
      result = EthereumContractABI::Encoders::IntEncoder.encode(-1)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end

    it "encodes negative 2 digit integer" do
      expected = "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B"
      expected_hex = EthereumContractABI::Util.toHexByteString(expected)
      result = EthereumContractABI::Encoders::IntEncoder.encode(-101)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end

    it "encodes basic integer" do
      expected = "0000000000000000000000000000000000000000000000000000000000000064"
      expected_hex = EthereumContractABI::Util.toHexByteString(expected)
      result = EthereumContractABI::Encoders::IntEncoder.encode(100)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end

    it "encodes larger integer" do
      expected = "000000000000000000000000000000000000000000000000000000003b9b58bd"
      expected_hex = EthereumContractABI::Util.toHexByteString(expected)
      result = EthereumContractABI::Encoders::IntEncoder.encode(1000036541)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end

    it "encodes very large integer" do
      expected = "000000000000000000000000Ae0EF4e561c31D5FBb62b8910B58Ae316cD22438"
      expected_hex = EthereumContractABI::Util.toHexByteString(expected)
      result = EthereumContractABI::Encoders::IntEncoder.encode(993697938008505089588736563107658604389239759928)
      expect(result.bytesize).to eq(32)
      expect(result).to eq(expected_hex)
    end
  end
end