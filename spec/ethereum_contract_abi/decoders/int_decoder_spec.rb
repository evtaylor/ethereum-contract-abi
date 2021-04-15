require 'ethereum-contract-abi/util'
require 'ethereum-contract-abi/decoders/int_decoder'

describe EthereumContractABI::Decoders::IntDecoder do
  describe "decode" do
    it "decodes 0 in hex" do
      encoded = "0000000000000000000000000000000000000000000000000000000000000000"
      expected = 0
      result = EthereumContractABI::Decoders::IntDecoder.decode(encoded)
      expect(result).to eq(expected)
    end

    it "decodes 1 in hex" do
      encoded = "0000000000000000000000000000000000000000000000000000000000000001"
      expected = 1
      result = EthereumContractABI::Decoders::IntDecoder.decode(encoded)
      expect(result).to eq(expected)
    end
  end
end