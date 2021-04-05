require '../../../lib/ethereum_contract_abi/types/bytes'

describe EthereumContractABI::Types::Bytes do
  describe "encode" do
    it "encodes bytes" do
      expected = "\xAB" + EthereumContractABI::Constants::BYTE_ZERO * 31
      result = EthereumContractABI::Types::Bytes.encode("\xab")

      expect(result).to eq(expected)
      expect(result.bytesize).to eq(32)
    end
  end
end