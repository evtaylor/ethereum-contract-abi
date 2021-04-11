require 'encoders/int_encoder'

include EthereumContractABI::Encoders

module EthereumContractABI
  module ContractInterface
    module AbiTypes
      class Int
        def initialize(bits = 256)
          raise ArgumentError.new("8 must be a factor of bits") unless bits % 8 === 0
          @bits = bits
        end

        def to_s
          "int#{@bits}"
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

        def self.from_string(string_type)
          /(?<is_int>^int)(?<bits>\d+)?/ =~ string_type
          return nil unless is_int
          bits ? self.new(bits.to_i) : self.new
        end
      end
    end
  end
end