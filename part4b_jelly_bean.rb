# Part 4: Basic OOP
#
# (b) Create a class JellyBean that extends Dessert, and add a getter and setter for flavor. Modify
# delicious? to return false if the flavor is black licorice (but delicious? should still return true for all
# other flavors and for all non-JellyBean desserts).

class Dessert
    attr_accessor :name, :calories
    def initialize(name, calories)
        @name = name
        @calories = calories
    end
    def healthy?
        @calories > 200
    end
    def delicious?
        return true
    end
end



class JellyBean < Dessert
    attr_accessor :flavor
    def initialize(name, calories, flavor)
        super(name, calories)
        @flavor = flavor
    end
    def delicious?
        if @flavor.downcase == "black licorice"
            return false
        end
        # otherwise
        super()
    end
end

jujuba = JellyBean.new("jujuba", 280, "Blue Barry")
doce = JellyBean.new("candy", 120, "Black licorice")
puts "#{jujuba.name}, #{jujuba.calories}, helthy?: #{jujuba.healthy?}, delicious?: #{jujuba.delicious?}"
puts "#{doce.name}, #{doce.calories}, helthy?: #{doce.healthy?}, delicious?: #{doce.delicious?}"