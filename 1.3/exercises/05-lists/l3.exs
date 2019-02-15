# An Elixir single-quoted string is actually a list
# of individual character codes.
# Write a caesar(list, n) function
# that adds n to each list element,
# wrapping if the addition results in a character greater than z.

defmodule MyList do

  def caesar([], _n), do: []

  def caesar([ head | tail ], n)
    when head+n <= ?z,
    do: [ head+n | caesar(tail, n) ]

  def caesar([ head | tail ], n),
    do: [ head+n-26 | caesar(tail, n) ]

end

IO.puts MyList.caesar('ryvkve', 13)  #=> elixir
