#assume no whitespace or punctuation

str1 = "hello"
str2 = "olleh"
str3 = "zebra"

def first_anagram?(str1, str2)
  perms = str1.chars.permutation.to_a
  perms.each do |e|
    return true if str2 == e.join("")
  end
  false
end

p first_anagram?(str1, str2)
p first_anagram?(str1, str3)

def second_anagram?(str1, str2)
  word1 = str1.chars
  word2 = str2.chars
  word1.each_with_index do |e, i|
    word2.each_with_index do |e2, i|
      if e2 == e
        word2.delete_at(i)
        break
      end
    end
  end
  word2.empty?
end

p second_anagram?(str1, str2)
p second_anagram?(str1, str3)

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

p third_anagram?(str1, str2)
p third_anagram?(str1, str3)

def fourth_anagram?(str1, str2)
  word1 = Hash.new(0)
  word2 = Hash.new(0)

  str1.chars.each do |let|
    word1[let] += 1
  end
  str2.chars.each do |let|
    word2[let] += 1
  end

  word1 == word2
end

p fourth_anagram?(str1, str2)
p fourth_anagram?(str1, str3)

def bonus_anagram?(str1, str2)
  word = Hash.new(0)


  str1.chars.each do |let|
    word[let] += 1
  end
  str2.chars.each do |let|
    word[let] += 1
  end

  word.none? { |_, v| v.odd? }
end

p bonus_anagram?(str1, str2)
p bonus_anagram?(str1, str3)
