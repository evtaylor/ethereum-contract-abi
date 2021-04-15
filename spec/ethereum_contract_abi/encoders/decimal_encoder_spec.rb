require 'ethereum-contract-abi/encoders/decimal_encoder'
require 'ethereum-contract-abi/util'

include EthereumContractABI::Encoders

describe EthereumContractABI::Encoders::DecimalEncoder do
  describe "encode" do
    it "encodes basic decimal number with 2 digits of precision" do
      expected = "0000000000000000000000000000000000000000000000000000000000001B39"
      expected_hex = EthereumContractABI::Util.toHexByteString(expected)
      result = DecimalEncoder.encode_value(69.69, 2)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end

    it "encodes basic negative decimal number with 2 digits of precision" do
      expected = "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4C7"
      expected_hex = EthereumContractABI::Util.toHexByteString(expected)
      result = DecimalEncoder.encode_value(-69.69, 2)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end
  end
end