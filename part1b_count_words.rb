# Part 1: fun with strings
#
# (b) Given a string of input, return a hash whose keys are words in the string and whose values
# are the number of times each word appears. Don't use for-loops. (But iterators like each are
# permitted.) Nonwords should be ignored. Case shouldn't matter. A word is defined as a string
# of characters between word boundaries. (Hint: the sequence \b in a Ruby regexp means "word
# boundary".)
# Example:
# count_words("A man, a plan, a canal -- Panama")
# # => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
# count_words "Doo bee doo bee doo" # => {'doo' => 3, 'bee' => 2}
# def count_words(string)
# # your code here
# end

def count_words(str)
    hash = Hash.new(0)
    str.scan(/[a-zA-Z]+[a-zA-Z'a-zA-Z]?/).each { |word|  hash[word.downcase] += 1 }
    hash
end

puts count_words("A man, a plan, a canal -- Panama")
puts count_words("Doo bee doo bee doo")

