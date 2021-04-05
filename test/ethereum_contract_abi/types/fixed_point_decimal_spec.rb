require '../../../lib/ethereum_contract_abi/types/fixed_point_decimal'

describe EthereumContractABI::Types::FixedPointDecimal do
  describe "encode" do
    it "encodes basic decimal number with 2 digits of precision" do
      expected = "0x0000000000000000000000000000000000000000000000000000000000001B39"
      expect(EthereumContractABI::Types::FixedPointDecimal.encode(69.69, 2)).to eq(expected)
    end

    it "encodes basic negative decimal number with 2 digits of precision" do
      expected = "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4C7"
      expect(EthereumContractABI::Types::FixedPointDecimal.encode(-69.69, 2)).to eq(expected)
    end
  end
end