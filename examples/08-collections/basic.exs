data = ["aaa", "bb", "cccc", "d"]

# return longest word
res = Enum.reduce(data, fn word, longest ->
                    if String.length(word) > String.length(longest) do
                      word
                    else
                      longest
                    end
                  end
)

IO.puts res



# return length of the longest word

res1 = Enum.reduce(data, 0, fn word, longest ->
                    if String.length(word) > longest do
                     String.length(word)
                    else
                      longest
                    end
                  end
)

IO.puts res1
