require 'encoders/int_encoder'

include EthereumContractABI::Encoders

module EthereumContractABI
  module ContractInterface
    module AbiTypes
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

        def self.from_string(string_type)
          string_type === 'bool' ? self.new : nil
        end
      end
    end
  end
end