require 'encoders/decimal_encoder'

include EthereumContractABI::Encoders

module EthereumContractABI
  module ContractInterface
    module AbiTypes
      class Fixed
        def initialize(bits = 128, precision = 18)
          raise ArgumentError.new("8 must be a factor of bits") unless bits % 8 === 0
          raise ArgumentError.new("bits must be: 8 <= bits <= 256") unless 8 <= bits && bits <= 256
          raise ArgumentError.new("precision must be: 0 < precision <= 80") unless 0 < precision && precision <= 80
          @bits = bits
          @precision = precision
        end

        def to_s
          "fixed#{@bits}x#{@precision}"
        end

        def valid_value?(number)
          return false unless number.is_a? Numeric
          return false unless number.round(0).bit_length <= @bits
          true
        end

        def encode_value(number)
          raise ArgumentError unless valid_value?(number)
          DecimalEncoder.encode_value(number, @precision)
        end

        def self.from_string(string_type)
          /(?<type>fixed)|(?<bits>\d+)x(?<precision>\d+)?/ =~ string_type
          return nil unless type

          bits && precision ? self.new(bits.to_i, precision.to_i) : self.new
        end
      end
    end
  end
end