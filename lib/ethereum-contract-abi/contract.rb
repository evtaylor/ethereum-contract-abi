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

    def has_function?(name, with_inputs, with_outputs)
      return false unless function_exists?(name)
      func = function(name)
      return false unless func.inputs.size == with_inputs.size
      return false unless func.outputs.size == with_outputs.size

      input_type_strings = func.inputs.map {|i| i.type.to_s }
      expected_input_type_strings = with_inputs.map {|i| i.type.to_s }
      output_type_string = func.outputs.map {|i| i.type.to_s }
      expected_output_type_string = with_outputs.map {|i| i.type.to_s }

      Set.new(expected_input_type_strings) == Set.new(input_type_strings) && Set.new(expected_output_type_string) == Set.new(output_type_string)
    end
  end
end