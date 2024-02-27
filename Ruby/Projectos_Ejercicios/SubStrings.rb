


def substrings(string, dictionary)
    string = string.downcase
    dictionary.reduce(Hash.new(0)) do |result, word|
        result[word] += string.scan(word).length if string.include?(word)
        result
    end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
resultado = substrings("Howdy partner, sit down! How's it going?", dictionary)

puts resultado
