require 'ethereum-contract-abi/encoders/bytes_encoder'
require 'ethereum-contract-abi/contract/abi_types/base_type'

include EthereumContractABI::Encoders

module EthereumContractABI
  module ContractInterface
    module AbiTypes
      class Bytes < BaseType
        def initialize(bytes = nil)
          @bytes = bytes
        end

        def is_dynamic
          @bytes.nil?
        end

        def bytesize
          @bytes.nil? ? nil : (@bytes.to_f/32.0).ceil
        end

        def to_s
          "bytes#{@bytes}"
        end

        def valid_value?(value)
          if @bytes.nil?
            return true
          end
          value.bytesize <= @bytes
        end

        def encode_value(bytes)
          raise ArgumentError unless valid_value?(bytes)
          BytesEncoder.encode(bytes)
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