module EthereumContractABI
  module Types
    class Int
      def self.encode(int)
        "#{"0x" + ("%064x" % int).upcase.gsub(/\../, "FF")}"
      end
    end
  end
end