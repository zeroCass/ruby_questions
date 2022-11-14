# Part 4: Basic OOP
#
#(a) Create a class Dessert with getters and setters for name and
# calories. Define instance methods healthy?, which returns true if a dessert has less than 200
# calories, and delicious?, which returns true for all desserts.


class Dessert
    attr_accessor :name, :calories
    def initialize(name, calories)
        @name = name
        @calories = calories
    end
    def healthy?
        return true unless @calories > 200
        return false
    end
    def delicious?
        return true
    end
end


cake = Dessert.new("Cake", 190)
mousse = Dessert.new("Mousse", 350)
puts "#{cake.name}, #{cake.calories}, helthy?: #{cake.healthy?}, delicious?: #{cake.delicious?}"
puts "#{mousse.name}, #{mousse.calories}, helthy?: #{mousse.healthy?}, delicious?: #{mousse.delicious?}"