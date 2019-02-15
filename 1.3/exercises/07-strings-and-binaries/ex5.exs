# Write a function that takes a list of dqs and
# prints each on a separate line,
# centered in a column that has the width of the longest string.
# Makesure it works with UTF characters.

# that's little reminder on import - makes code cleaner, especially in such small problems
# import Enum, only: [max: 1, map: 2, each: 2]
# import String, only: [length: 1, duplicate: 2]
# import Kernel, except: [length: 1]

defmodule MyString do
  def center(strings) do
    column_size = strings |> Enum.max_by(&String.length/1) |> String.length
    for s <- strings do
      len = String.length(s)
      left_shift = div(column_size - len, 2)
      result = s |> String.pad_leading(left_shift + len) |> String.pad_trailing(column_size)
      IO.puts result
    end
  end
end

MyString.center(["cat", "zebra", "elephant"])
