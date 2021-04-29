require 'ethereum-contract-abi/contract/function'
require 'ethereum-contract-abi/contract/input'
require 'ethereum-contract-abi/contract/output'
require 'ethereum-contract-abi/contract/abi_types/uint'
require 'ethereum-contract-abi/contract/abi_types/bool'
require 'ethereum-contract-abi/contract/abi_types/string'
require 'ethereum-contract-abi/contract/abi_types/address'
require 'ethereum-contract-abi/util'

include EthereumContractABI
include EthereumContractABI::ContractInterface
include EthereumContractABI::ContractInterface::AbiTypes

describe EthereumContractABI::ContractInterface::Function do
  describe "valid_args?" do
    it 'should return false with wrong number of arguments' do
      name = "Test Function"
      inputs = [Input.new('tokenId', Uint.new(8))]
      outputs = [Output.new('tokenId', Uint.new(8))]
      func = Function.new(name, inputs, outputs)

      result = func.valid_args?([12345, 67891])
      expect(result).to(eq(false))
    end
  end

  describe "signature" do
    it 'get function signature as a string' do
      name = "baz"
      inputs = [Input.new('x', Uint.new(32)), Input.new('y', Bool.new)]
      outputs = [Output.new('y', Bool.new)]
      func = Function.new(name, inputs, outputs)

      expected = "baz(uint32,bool)"
      expect(func.signature).to(eq(expected))
    end
  end

  describe "method id" do
    it 'should return Keccak hash of the ASCII form of the signature' do
      name = "baz"
      inputs = [Input.new('x', Uint.new(32)), Input.new('y', Bool.new)]
      outputs = [Output.new('y', Bool.new)]
      func = Function.new(name, inputs, outputs)

      expected = "cdcd77c0"
      expected_hex = EthereumContractABI::Util.toHexByteString(expected)
      expect(func.method_id).to(eq(expected_hex))
    end
  end

  describe "encode_call" do
    it 'encode function call arguments' do
      name = "baz"
      inputs = [Input.new('x', Uint.new(32)), Input.new('y', Bool.new)]
      outputs = [Output.new(Bool.new)]
      func = Function.new(name, inputs, outputs)

      result = func.encode_call(69, true)
      expected = "0xcdcd77c000000000000000000000000000000000000000000000000000000000000000450000000000000000000000000000000000000000000000000000000000000001"
      expect(result).to(eq(expected))
    end

    it 'encode function call with single argument' do
      name = "tokenURI"
      inputs = [Input.new('_tokenId', Uint.new(256))]
      outputs = [Output.new(EthereumContractABI::ContractInterface::AbiTypes::String.new)]
      func = Function.new(name, inputs, outputs)

      result = func.encode_call(1000036541)
      expected = "0xc87b56dd000000000000000000000000000000000000000000000000000000003b9b58bd"
      expect(result).to(eq(expected))
    end

    it 'encode function call with no arguments' do
      name = "symbol"
      inputs = []
      outputs = [Output.new(EthereumContractABI::ContractInterface::AbiTypes::String.new)]
      func = Function.new(name, inputs, outputs)

      result = func.encode_call
      expected = "0x95d89b41"
      expect(result).to(eq(expected))
    end

    it 'encode function call with one address input' do
      name = "balanceOf"
      inputs = [Input.new('owner', Address.new)]
      outputs = [Output.new(EthereumContractABI::ContractInterface::AbiTypes::String.new)]
      func = Function.new(name, inputs, outputs)

      result = func.encode_call(993697938008505089588736563107658604389239759928)
      expected = "0x70a08231000000000000000000000000ae0ef4e561c31d5fbb62b8910b58ae316cd22438"
      expect(result).to(eq(expected))
    end
  end

  describe "decode_output" do
    it "decodes the dynamic function output of a simple function" do
      name = "symbol"
      inputs = []
      outputs = [Output.new(EthereumContractABI::ContractInterface::AbiTypes::String.new)]
      func = Function.new(name, inputs, outputs)

      function_output = "0x00000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000005504d4f4e43000000000000000000000000000000000000000000000000000000"
      result = func.decode_output(function_output)
      expected = ["PMONC"]
      expect(result).to(eq(expected))
    end

    it "decodes the dynamic function output of a long string" do
      name = "symbol"
      inputs = []
      outputs = [Output.new(EthereumContractABI::ContractInterface::AbiTypes::String.new)]
      func = Function.new(name, inputs, outputs)

      function_output = "0x0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000002c68747470733a2f2f6d6574612e706f6c6b616d6f6e2e636f6d2f6d6574613f69643d313030303033363534310000000000000000000000000000000000000000"
      result = func.decode_output(function_output)
      expected = ["https://meta.polkamon.com/meta?id=1000036541"]
      expect(result).to(eq(expected))
    end

    it "decodes static output of a function" do
      name = "symbol"
      inputs = []
      outputs = [Output.new(EthereumContractABI::ContractInterface::AbiTypes::Uint.new)]
      func = Function.new(name, inputs, outputs)

      function_output = "0x0000000000000000000000000000000000000000000000000000000000000004"
      result = func.decode_output(function_output)
      expected = [4]
      expect(result).to(eq(expected))
    end

    it "decodes static output of a function with multiple outputs" do
      name = "symbol"
      inputs = []
      outputs = [
        Output.new(EthereumContractABI::ContractInterface::AbiTypes::Uint.new),
        Output.new(EthereumContractABI::ContractInterface::AbiTypes::Uint.new),
      ]
      func = Function.new(name, inputs, outputs)

      function_output = "0x00000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000005"
      result = func.decode_output(function_output)
      expected = [4, 5]
      expect(result).to(eq(expected))
    end

    it "decodes the dynamic function output of a string url and strips extra bytes at the end" do
      name = "symbol"
      inputs = []
      outputs = [Output.new(EthereumContractABI::ContractInterface::AbiTypes::String.new)]
      func = Function.new(name, inputs, outputs)

      function_output = "0x0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000002d68747470733a2f2f61786965696e66696e6974792e636f6d2f6170692f61786965732f3632323137000000000000000000000000000000000000000000000000"
      result = func.decode_output(function_output)
      expected = ["https://axieinfinity.com/api/axies/62217"]
      expect(result).to(eq(expected))
    end
  end
end