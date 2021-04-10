require 'types/decimal'
require 'util'

describe EthereumContractABI::Types::FixedPointDecimal do
  describe "encode" do
    it "encodes basic decimal number with 2 digits of precision" do
      expected = "0000000000000000000000000000000000000000000000000000000000001B39"
      expected_hex = EthereumContractABI::Util.strToEscapedHex(expected)
      result = EthereumContractABI::Types::FixedPointDecimal.encode(69.69, 2)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end

    it "encodes basic negative decimal number with 2 digits of precision" do
      expected = "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4C7"
      expected_hex = EthereumContractABI::Util.strToEscapedHex(expected)
      result = EthereumContractABI::Types::FixedPointDecimal.encode(-69.69, 2)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end
  end
end