require 'types/bool'
require 'util'

describe EthereumContractABI::Types::Bool do
  describe "encode" do
    it "encodes boolean true" do
      expected = "0000000000000000000000000000000000000000000000000000000000000001"
      expected_hex = EthereumContractABI::Util.strToEscapedHex(expected)
      result = EthereumContractABI::Types::Bool.encode(true)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end

    it "encodes boolean false" do
      expected = "0000000000000000000000000000000000000000000000000000000000000000"
      expected_hex = EthereumContractABI::Util.strToEscapedHex(expected)
      result = EthereumContractABI::Types::Bool.encode(false)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end
  end
end