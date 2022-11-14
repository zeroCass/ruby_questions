#Part 6: advanced OOP,metaprogramming, open classes
#and duck typing, continued
#
# b) Adapt your solution from the "palindromes" question so that instead of
# writing palindrome?("foo") you can write "foo".palindrome? HINT: this should
# require fewer than 5 lines of code.
#
# c) Adapt your palindrome solution so that it works on Enumerables. That is:
# [1,2,3,2,1].palindrome? # => true
# (It's not necessary for the collection's elements to be palindromes themselves--only that the toplevel collection be a palindrome.) HINT: this should require fewer than 5 lines of
# code. Although hashes are considered Enumerables, your solution does not need to make
# sense for hashes (though it should not error).

class String 
    def palindrome?()
        str = self.downcase().gsub(/[^a-z]/, "")
        str.reverse().eql?(str)
    end
end

module Enumerable
    def palindrome?()
        palindrome = self
        palindrome.reverse() == palindrome
    end
end

puts "A man, a plan, a canal -- Panama".palindrome?
puts "Abracadabra".palindrome?
puts [1, 2, 3, 2, 1].palindrome?
puts [1, 2, 3, 4, 5].palindrome?