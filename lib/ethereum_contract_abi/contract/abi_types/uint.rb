require 'encoders/int_encoder'
require 'contract/abi_types/int'

include EthereumContractABI::Encoders

module EthereumContractABI
  module ContractInterface
    module AbiTypes
      class Uint < Int
        def to_s
          "uint#{@bits}"
        end

        def valid_value?(number)
          super(number) && number >= 0
        end

        def self.from_string(string_type)
          /(?<is_uint>uint)(?<bits>\d+)?/ =~ string_type
          return nil unless is_uint
          bits ? self.new(bits.to_i) : self.new
        end
      end
    end
  end
end