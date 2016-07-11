defmodule MyList do
  def map([], _func), do: []
  def map([head|tail], func), do: [func.(head) | map(tail, func)]
end

IO.inspect MyList.map([1,2,3], &(&1 + 1))
IO.inspect MyList.map([1,2,3], &(&1))
IO.inspect MyList.map([1,2,3], &(&1 > 2))
IO.inspect MyList.map [1,2,3], fn (n) -> n*n end
