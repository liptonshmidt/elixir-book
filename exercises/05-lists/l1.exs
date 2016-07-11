# Write a mapsum function that takes a list and a function.
# It applies the function to each element of the list
# and then sums the result, so
# iex> MyList.mapsum [1, 2, 3], &(&1 * &1)
# ...is 14

defmodule MyList do
  def mapsum([], _fun), do: 0
  def mapsum([head | tail], fun), do: fun.(head) + mapsum(tail, fun)
end

IO.puts MyList.mapsum([1, 2, 3], &(&1 * &1))
