defmodule MyList do
  def reduce([], inital_val, _), do: inital_val
  # my first attempt
  def reduce([head|tail], inital_val, fun), do: fun.(head, reduce(tail, inital_val, fun))

  # example by the author
  # this is better because of @tailrec
  def reduce_from_book([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end
end

IO.puts MyList.reduce([], 4, &(&1 * &2)) # should be 4
IO.puts MyList.reduce([1,2,3], 4, &(&1 * &2)) # should be 4 * 1 * 2 * 3 = 24
IO.puts MyList.reduce([1,2,3], 4, &(&1 + &2)) # should be 4 + 1 + 2 + 3 = 10
