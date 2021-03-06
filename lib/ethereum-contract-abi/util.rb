module EthereumContractABI
  class Util

    def self.toHexByteString(str)
      if str.start_with?("0x")
        return [str.slice(2, str.length)].pack("H*")
      end
      [str].pack("H*")
    end

    def self.fromHexByteString(str, with_prefix: true)
      prefix = with_prefix ? "0x" : ""
      prefix + str.unpack("H*").first
    end

    def self.remove_hex_prefix(str)
      str.slice(2, str.length)
    end
    
    def self. keccak_hash(str)
      [Digest::Keccak256.new.hexdigest(signature)].pack("H*")
    end
  end
end