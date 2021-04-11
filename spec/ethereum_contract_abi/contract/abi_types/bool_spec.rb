require 'contract/abi_types/bool'
require 'util'

describe EthereumContractABI::ContractInterface::AbiTypes::Bool do
  describe "encode" do
    it "encodes boolean true" do
      expected = "0000000000000000000000000000000000000000000000000000000000000001"
      expected_hex = EthereumContractABI::Util.strToEscapedHex(expected)
      bool = EthereumContractABI::ContractInterface::AbiTypes::Bool.new
      result = bool.encode_value(true)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end

    it "encodes boolean false" do
      expected = "0000000000000000000000000000000000000000000000000000000000000000"
      expected_hex = EthereumContractABI::Util.strToEscapedHex(expected)
      bool = EthereumContractABI::ContractInterface::AbiTypes::Bool.new
      result = bool.encode_value(false)
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(32)
    end
  end
end