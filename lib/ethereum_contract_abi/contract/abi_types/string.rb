require 'encoders/bytes_encoder'

include EthereumContractABI::Encoders

module EthereumContractABI
  module ContractInterface
    module AbiTypes
      class String
        def to_s
          "string"
        end

        def valid_value?(value)
          return false unless value.is_a? String
          true
        end

        def encode_value(value)
          raise ArgumentError unless valid_value?(value)
          BytesEncoder.encode(value)
        end

        def self.from_string(string_type)
          string_type === 'string' ? self.new : nil
        end
      end
    end
  end
end