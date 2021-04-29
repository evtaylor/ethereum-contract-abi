require 'ethereum-contract-abi/encoders/bytes_encoder'
require 'ethereum-contract-abi/contract/abi_types/base_type'

include EthereumContractABI::Encoders

module EthereumContractABI
  module ContractInterface
    module AbiTypes
      class Bytes < BaseType
        def initialize(num_bytes = nil)
          @num_bytes = num_bytes
        end

        def is_dynamic
          @num_bytes.nil?
        end

        def bytesize
          @num_bytes.nil? ? nil : (@num_bytes.to_f/32.0).ceil
        end

        def to_s
          "bytes#{@num_bytes}"
        end

        def valid_value?(value)
          true
        end

        def encode_value(bytes)
          BytesEncoder.encode(bytes, @num_bytes)
        end

        def self.from_string(string_type)
          /(?<is_bytes>bytes)(?<bytes>\d+)?/ =~ string_type
          return nil unless is_bytes
          bytes ? self.new(bytes.to_i) : self.new
        end
      end
    end
  end
end