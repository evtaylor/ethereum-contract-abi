require '../../../lib/ethereum_contract_abi/types/decimal'
require '../../../lib/ethereum_contract_abi/util'

describe EthereumContractABI::Types::FixedPointDecimal do
  describe "encode" do
    it "encodes basic decimal number with 2 digits of precision" do
      expected = "0000000000000000000000000000000000000000000000000000000000001B39"
      expectedHex = EthereumContractABI::Util.strToEscapedHex(expected)
      result = EthereumContractABI::Types::FixedPointDecimal.encode(69.69, 2)
      expect(result).to eq(expectedHex)
      expect(result.bytesize).to eq(32)
    end

    it "encodes basic negative decimal number with 2 digits of precision" do
      expected = "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4C7"
      expectedHex = EthereumContractABI::Util.strToEscapedHex(expected)
      result = EthereumContractABI::Types::FixedPointDecimal.encode(-69.69, 2)
      expect(result).to eq(expectedHex)
      expect(result.bytesize).to eq(32)
    end
  end
end