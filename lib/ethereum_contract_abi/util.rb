module EthereumContractABI
  class Util
    def self.strToEscapedHex(str)
      [str].pack("H*")
    end
  end
end