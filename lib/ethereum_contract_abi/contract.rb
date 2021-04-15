module EthereumContractABI
  class Contract
    def initialize(functions, events)
      @functions = functions.to_h { |func| [func.name, func]}
      @events = events
    end

    def functions
      @functions.values
    end

    def function(name)
      @functions.dig(name)
    end

    def function_exists?(name)
      @functions.key? name
    end
  end
end