require '../../../lib/ethereum_contract_abi/types/bool'

describe EthereumContractABI::Types::Bool do
  describe "encode" do
    it "encodes boolean true" do
      expected = "0x0000000000000000000000000000000000000000000000000000000000000001"
      expect(EthereumContractABI::Types::Bool.encode(true)).to eq(expected)
    end

    it "encodes boolean false" do
      expected = "0x0000000000000000000000000000000000000000000000000000000000000000"
      expect(EthereumContractABI::Types::Bool.encode(false)).to eq(expected)
    end
  end
end