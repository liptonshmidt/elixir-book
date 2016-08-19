# Implement the following Enum functions
# using no library functions or list comprehensions:
# all?, each, filter, split, and take.

defmodule MyList do
  def all?([], f), do: true
  def all?([ h | t ], f) do
    f.(h) && all?(t, f)
  end
end

IO.inspect MyList.all?([], &(&1 > 0))
IO.inspect MyList.all?([-1,0,1], &(&1 > 0))
IO.inspect MyList.all?([1,2,3], &(&1 > 0))
