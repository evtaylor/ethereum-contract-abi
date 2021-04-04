require '../../../lib/ethereum_contract_abi/types/uint'

describe EthereumContractABI::Types::Uint do
  describe "encode" do
    it "encodes basic uint" do
      expect(EthereumContractABI::Types::Uint.encode(69)).to eq('45')
    end
  end
end