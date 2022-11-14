class Converter
    attr_accessor :value
    @@exchanges = {:dolar => 5.14, :euro => 5.18, :iene => 0.035, :libra => 5.93}
    
    def initialize(value)
        @value = value
    end


    def method_missing(method)
        # group[1] - string     group[2] - last char
        method_regex = method.match(/(?:[a-z]*\_)?([a-z]*)([a-z])$/) #regex to capture only words after '_'and the last char
        method = method_regex[1]

        # if the method name ends with 's', ignore
        if method_regex[2] != "s"
            method += method_regex[2] #grab the last char
        end

        if @@exchanges.include?(method.to_sym())
            return puts "The value #{@value} in real is #{@@exchanges[method.to_sym] * @value} in #{method}"
        else
            return 'Error'
        end
    end
end


c = Converter.new(100)
puts c.dolar()
puts c.to_euros()

    