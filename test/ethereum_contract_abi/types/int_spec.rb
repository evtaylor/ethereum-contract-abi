require '../../../lib/ethereum_contract_abi/types/int'

describe EthereumContractABI::Types::Int do
  describe "encode" do
    it "encodes basic integer" do
      expected = "0x0000000000000000000000000000000000000000000000000000000000000045"
      expect(EthereumContractABI::Types::Int.encode(69)).to eq(expected)
    end

    it "encodes negative integer" do
      expected = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
      expect(EthereumContractABI::Types::Int.encode(-1)).to eq(expected)
    end

    it "encodes negative 2 digit integer" do
      expected = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B"
      expect(EthereumContractABI::Types::Int.encode(-101)).to eq(expected)
    end

  end
end