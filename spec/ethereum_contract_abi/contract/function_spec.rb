require 'contract/function'
require 'contract/input'
require 'contract/output'
require 'contract/types'

include EthereumContractABI::ContractInterface

describe EthereumContractABI::ContractInterface::Function do
  describe "valid_args?" do
    it 'should return false with wrong number of arguments' do
      name = "Test Function"
      inputs = [Input.new('tokenId', Types::UINT)]
      outputs = [Output.new('tokenId', Types::UINT)]
      func = Function.new(name, inputs, outputs)

      result = func.valid_args?(12345, 67891)
      expect(result).to(eq(false))
    end
  end
end