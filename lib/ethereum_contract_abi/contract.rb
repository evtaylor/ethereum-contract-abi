module EthereumContractABI
  class Contract
    def initialize(functions, events)
      @functions = functions
      @events = events
    end

    def encode_function_call(function_name, *inputs)

    end
  end
end