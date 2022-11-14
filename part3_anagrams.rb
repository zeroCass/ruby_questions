#Part 3: anagrams
#
# An anagram is a word obtained by rearranging the letters of another word. For example, "rats",
# "tars" and "star" are an anagram group because they are made up of the same letters.
# Given an array of strings, write a method that groups them into anagram groups and returns the
# array of groups. Case doesn't matter in classifying string as anagrams (but case should be
# preserved in the output), and the order of the anagrams in the groups doesn't matter.



# return words order by a-z
def order_words(words)
    return words.map do |str|
        new_str = str.chars.sort().join()
    end
end

# return bool if words its in array[0][0]
def find_word(array, word)
    array.each do |elem| 
        if elem[0] == word
            return true
        end 
    end
    return false
end

# group all anagrams in array and return a array with all anagrams array matched
def combine_anagrams(words)
    # get words order
    words = order_words(words)

    anagrams = []
    words.each_with_index do |str_a, i|
        # if word was not found, then go on
        if !find_word(anagrams, str_a)
            # create a new array of match
            anagrams_match = [str_a]
            # for words[i+1] until words.lenght
            (i+1..words.length).each do |j|
                if words[j] == str_a
                    anagrams_match.append(words[j])
                end
            end
            anagrams.append(anagrams_match)
        end
        
    end
    return anagrams
end

start = Time.now    
puts "#{combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams','scream'])}"
finshed = Time.now - start
puts "exec in #{finshed}s"
