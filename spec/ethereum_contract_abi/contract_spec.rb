require 'ethereum-contract-abi/contract/function'
require 'ethereum-contract-abi/contract'

include EthereumContractABI::ContractInterface

describe EthereumContractABI::Contract do
  describe "function" do
    it "should return function by name" do
      function_1 = instance_double(Function, {
        :name => 'coolFunction'
      })
      contract = EthereumContractABI::Contract.new([function_1], [])
      expect(contract.function("coolFunction")).to(eq(function_1))
    end

    it "should return nil if no function with name" do
      function_1 = instance_double(Function, {
        :name => 'coolFunction'
      })
      contract = EthereumContractABI::Contract.new([function_1], [])
      expect(contract.function("uncoolFunction")).to(eq(nil))
    end
  end

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