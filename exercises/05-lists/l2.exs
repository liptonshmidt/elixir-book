# Write a max(list) that returns the element
# with the maximum value in the list.
# (This is slightly trickier than it sounds.)

defmodule MyList do
  def max_via_reduce([]), do: nil

  def max_via_reduce([head | tail]) do
   reduce(tail, head, &(max(&1, &2)))
  end

  def reduce([], value, _), do: value
  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

  # implementation below doesn't use reduce

  def max([x]), do: x
  def max([head | tail]), do: Kernel.max(head, max(tail))
end

IO.puts MyList.max_via_reduce([1,5,2])
IO.puts MyList.max_via_reduce([])
IO.puts MyList.max_via_reduce([-15, -1, -19])

IO.puts "# # # # # # #"

IO.puts MyList.max([1,5,2])
IO.puts MyList.max([-5])
IO.puts MyList.max([-15, -1, -19])

