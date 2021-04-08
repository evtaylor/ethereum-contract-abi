require 'contract/function'
require 'contract'

include EthereumContractABI::ContractInterface

describe EthereumContractABI::Contract do
  describe "function_exists?" do
    it 'should return false when no function exists on contract' do
      function_1 = instance_double(Function, {
        :name => 'coolFunction'
      })
      contract = EthereumContractABI::Contract.new([function_1], [])
      expect(contract.function_exists?("uncoolFunction")).to(eq(false))
    end

    it 'should return true when function exists on contract' do
      function_1 = instance_double(Function, {
        :name => 'coolFunction'
      })
      contract = EthereumContractABI::Contract.new([function_1], [])
      expect(contract.function_exists?("coolFunction")).to(eq(true))
    end
  end
end