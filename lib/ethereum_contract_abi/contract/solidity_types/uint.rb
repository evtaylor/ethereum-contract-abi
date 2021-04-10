module EthereumContractABI
  module ContractInterface
    module SolidityTypes
      class Uint
        def initialize(bits = 256)
          raise ArgumentError.new("8 must be a factor of bits") unless bits % 8 === 0
          @bits = bits
        end

        def valid_value?(number)
          return false unless number.is_a? Numeric
          return false unless number.bit_length <= @bits
          true
        end

        def encode_value(number)
          raise ArgumentError unless valid_value?(number)
          IntEncoder.encode(number)
        end
      end
    end
  end
end