module EthereumContractABI
  module ContractInterface
    module SolidityTypes
      class Uint
        def initialize(bits = 256)
          @bits = bits
        end

        def valid_value?(number)
          return false unless number.is_a? Numeric
          return false unless 0 <= number <= 255
          true
        end

        def encode_value(number)

        end
      end
    end
  end
end