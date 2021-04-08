require 'contract/function'
require 'contract/input'
require 'contract/output'
require 'contract/types'

include EthereumContractABI::ContractInterface

describe EthereumContractABI::ContractInterface::Function do
  describe "Function" do
    it 'should encode a function call with arguments' do
      name = "Test Function"
      inputs = [Input.new('tokenId', Types::UINT)]
      outputs = [Output.new('tokenId', Types::UINT)]
      func = Function.new(name, inputs, outputs)

      argument = 12345
      result = func.encode_call(argument)
    end
  end
end