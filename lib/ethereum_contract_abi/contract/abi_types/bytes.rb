require 'encoders/bytes_encoder'

include EthereumContractABI::Encoders

module EthereumContractABI
  module ContractInterface
    module AbiTypes
      class Bytes
        def initialize(bytes = nil)
          @bytes = bytes
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