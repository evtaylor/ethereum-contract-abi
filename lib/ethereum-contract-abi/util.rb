module EthereumContractABI
  class Util

    def self.toHexByteString(str)
      [str].pack("H*")
    end

    def self.fromHexByteString(str)
      str.unpack("H*").first
    end
    
    def self. keccak_hash(str)
      [Digest::SHA3.new(256, true ).hexdigest(signature)].pack("H*")
    end
  end
end