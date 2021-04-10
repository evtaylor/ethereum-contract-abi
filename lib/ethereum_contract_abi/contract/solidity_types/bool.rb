module EthereumContractABI
  module ContractInterface
    module SolidityTypes
      class Bool
        def to_s
          "bool"
        end

        def valid_value?(bool)
          [true, false].include? bool
        end

        def encode_value(bool)
          raise ArgumentError unless valid_value?(bool)
          IntEncoder.encode(bool ? 1 : 0)
        end
      end
    end
  end
end