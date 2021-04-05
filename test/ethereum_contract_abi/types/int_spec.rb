require '../../../lib/ethereum_contract_abi/types/int'
require '../../../lib/ethereum_contract_abi/util'

describe EthereumContractABI::Types::Int do
  describe "encode" do
    it "encodes basic integer" do
      expected = "0000000000000000000000000000000000000000000000000000000000000045"
      expected_hex = EthereumContractABI::Util.strToEscapedHex(expected)
      result = EthereumContractABI::Types::Int.encode(69)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end

    it "encodes negative integer" do
      expected = "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
      expected_hex = EthereumContractABI::Util.strToEscapedHex(expected)
      result = EthereumContractABI::Types::Int.encode(-1)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end

    it "encodes negative 2 digit integer" do
      expected = "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B"
      expected_hex = EthereumContractABI::Util.strToEscapedHex(expected)
      result = EthereumContractABI::Types::Int.encode(-101)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end

  end
end