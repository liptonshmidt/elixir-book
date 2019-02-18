defmodule MyList do
  def max([x]), do: x
  def max([head | tail]), do: Kernel.max(head, max(tail))
end

IO.puts MyList.max([0])
IO.puts MyList.max([-1, 0, -2])
IO.puts MyList.max([1, 2, 3])
