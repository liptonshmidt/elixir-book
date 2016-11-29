defmodule MyString do
  def anagram?(word1, word2), do: Enum.sort(word1) == Enum.sort(word2)
end

IO.inspect MyString.anagram?('tracer', 'carter') # => true
IO.inspect MyString.anagram?('tracer', 'mercy') # => false
