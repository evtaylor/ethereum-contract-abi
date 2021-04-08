require 'contract/parser'

describe EthereumContractABI::ContractInterface::Parser do
  describe "from json" do
    it 'should parse from json string' do
      p FIXTURES
      contract_json = File.read(FIXTURES + '/contracts/0x85f0e02cb992aa1f9f47112f815f519ef1a59e2d.json')
      contract = EthereumContractABI::ContractInterface::Parser.from_json(contract_json)
      expect(contract).to be_a_kind_of(EthereumContractABI::Contract)
    end
  end
end