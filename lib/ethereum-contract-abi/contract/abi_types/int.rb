require 'ethereum-contract-abi/encoders/int_encoder'
require 'ethereum-contract-abi/decoders/int_decoder'
require 'ethereum-contract-abi/contract/abi_types/base_type'

include EthereumContractABI::Encoders
include EthereumContractABI::Decoders

module EthereumContractABI
  module ContractInterface
    module AbiTypes
      class Int < BaseType
        def initialize(bits = 256)
          raise ArgumentError.new("8 must be a factor of bits") unless bits % 8 === 0
          @bits = bits
        end

        def is_dynamic
          false
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

        def decode_value(value)
          IntDecoder.decode(value)
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