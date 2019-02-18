defmodule MyList do
  def flatten([]), do: []
  def flatten([h | t]), do: Enum.reverse(pflatten([h | t]))

  defp pflatten([]), do: []
  defp pflatten([h | t]), do: (pflatten(t) ++ pflatten(h))
  defp pflatten(x), do: [x]
end

IO.inspect MyList.flatten([])
IO.inspect MyList.flatten([[]])
IO.inspect MyList.flatten([[[]]])

IO.inspect MyList.flatten([1])
IO.inspect MyList.flatten([[1]])

IO.inspect MyList.flatten([1, 2])
IO.inspect MyList.flatten([1, 2, 3])
IO.inspect MyList.flatten([1, [2]])
IO.inspect MyList.flatten([[1], [2]])
IO.inspect MyList.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]])
IO.inspect MyList.flatten([ [[1], [ 2, 3, [4] ], 5], [[[6]]]])
