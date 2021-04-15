require 'ethereum-contract-abi/util'
require 'ethereum-contract-abi/decoders/string_decoder'

describe EthereumContractABI::Decoders::StringDecoder do
  describe "decode" do
    it "decodes string longer than 32 bytes" do
      encoded = "000000000000000000000000000000000000000000000000000000000000002c68747470733a2f2f6d6574612e706f6c6b616d6f6e2e636f6d2f6d6574613f69643d313030303033363534310000000000000000000000000000000000000000"
      expected = "https://meta.polkamon.com/meta?id=1000036541"
      result = EthereumContractABI::Decoders::StringDecoder.decode(encoded)
      expect(result).to eq(expected)
    end

    it "decodes string shorter than 32 bytes" do
      encoded = "0000000000000000000000000000000000000000000000000000000000000005504d4f4e43000000000000000000000000000000000000000000000000000000"
      expected = "PMONC"
      result = EthereumContractABI::Decoders::StringDecoder.decode(encoded)
      expect(result).to eq(expected)
    end
  end
end