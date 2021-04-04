module EthereumContractABI
  module Types
    class Uint
      def self.encode(int)
        int.to_s(16)
      end
    end
  end
end