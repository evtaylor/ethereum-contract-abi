module EthereumContractABI
  module ContractInterface
    module AbiTypes
      class BaseType
        def to_s
          raise NotImplementedError.new('to_s not implemented on type')
        end

        def is_dynamic
          true
        end

        def bytesize
          32
        end

        def encode_value(value)
          raise NotImplementedError.new('encode_value not implemented on type')
        end

        def decode_value(value)
          raise NotImplementedError.new('decode_value not implemented on type')
        end

        def self.from_string(string_type)
          raise NotImplementedError.new('from_string not implemented on type')
        end
      end
    end
  end
end