require 'ethereum-contract-abi/contract/abi_types/string'
require 'ethereum-contract-abi/util'

describe EthereumContractABI::ContractInterface::AbiTypes::String do
  describe "encode" do
    it "encodes string" do
      expected = "000000000000000000000000000000000000000000000000000000000000002c68747470733a2f2f6d6574612e706f6c6b616d6f6e2e636f6d2f6d6574613f69643d313030303033363534310000000000000000000000000000000000000000"
      expected_hex = EthereumContractABI::Util.toHexByteString(expected)
      string = EthereumContractABI::ContractInterface::AbiTypes::String.new
      result = string.encode_value("https://meta.polkamon.com/meta?id=1000036541")
      expect(result).to eq(expected_hex)
      expect(result.bytesize).to eq(96)
    end
  end
end