require 'ethereum-contract-abi/contract/function'
require 'ethereum-contract-abi/contract'
require 'ethereum-contract-abi/contract/input'
require 'ethereum-contract-abi/contract/output'
require 'ethereum-contract-abi/contract/abi_types/uint'
require 'ethereum-contract-abi/contract/abi_types/string'
require 'ethereum-contract-abi/contract/eip/constants'
require 'ethereum-contract-abi/contract/parsers/function_parser'
require 'json'

include EthereumContractABI::ContractInterface

describe EthereumContractABI::ContractInterface::Function do
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

  describe "has_function?" do
    it 'returns false when no function exists with name' do
      function_1 = instance_double(Function, {
        :name => 'coolFunction'
      })

      comparison_function = Function.new('coolFunc', [], [])
      contract = EthereumContractABI::Contract.new([function_1], [])
      expect(contract.has_function?(comparison_function)).to(eq(false))
    end

    it 'returns false when function exists with same name but has different number of inputs' do
      inputs = [Input.new('input1', AbiTypes::Uint.new), Input.new('input1', AbiTypes::Uint.new)]
      outputs = [Output.new('input1', AbiTypes::String.new)]

      function_1 = instance_double(Function, {
        :name => 'coolFunction',
        :inputs => [Input.new('input1', AbiTypes::Uint.new)],
        :outputs => outputs
      })
      comparison_function = Function.new('coolFunction', inputs, outputs)

      contract = EthereumContractABI::Contract.new([function_1], [])
      expect(contract.has_function?(comparison_function)).to(eq(false))
    end

    it 'returns false when function exists with same name but has different number of outputs' do
      inputs = [Input.new('input1', AbiTypes::Uint.new)]
      outputs = [Output.new('input1', AbiTypes::String.new), Output.new('input1', AbiTypes::String.new)]

      function_1 = instance_double(Function, {
        :name => 'coolFunction',
        :inputs => inputs,
        :outputs => [Output.new('input1', AbiTypes::String.new)]
      })
      comparison_function = Function.new('coolFunction', inputs, outputs)

      contract = EthereumContractABI::Contract.new([function_1], [])
      expect(contract.has_function?(comparison_function)).to(eq(false))
    end

    it 'returns true when function exists with same name, input types and output types' do
      inputs = [Input.new('input1', AbiTypes::Uint.new)]
      outputs = [Output.new('input1', AbiTypes::String.new)]

      function_1 = instance_double(Function, {
        :name => 'coolFunction',
        :inputs => inputs,
        :outputs => outputs
      })
      comparison_function = Function.new('coolFunction', inputs, outputs)

      contract = EthereumContractABI::Contract.new([function_1], [])
      expect(contract.has_function?(comparison_function)).to(eq(true))
    end

    it 'returns false with slightly different input type' do
      inputs = [Input.new('input1', AbiTypes::Uint.new(128))]
      outputs = [Output.new('input1', AbiTypes::String.new)]

      function_1 = instance_double(Function, {
        :name => 'coolFunction',
        :inputs => [Input.new('input1', AbiTypes::Uint.new(256))],
        :outputs => outputs
      })
      comparison_function = Function.new('coolFunction', inputs, outputs)

      contract = EthereumContractABI::Contract.new([function_1], [])
      expect(contract.has_function?(comparison_function)).to(eq(false))
    end
  end

  describe "implements interface" do
    it "should return true when contract implements erc721 metadata" do
      erc721_json = File.read(FIXTURES + '/interfaces/erc721metadata.json')
      functions = JSON.parse(erc721_json).map{ |fhash| Parsers::FunctionParser.from_hash(fhash)}
      contract = EthereumContractABI::Contract.new(functions, [])
      expect(contract.implements_interface(EIP::ERC721_METADATA)).to(eq(true))
    end
  end
end