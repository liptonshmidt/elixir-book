defmodule MyList do
  def flatten(list), do: do_flatten(list, [])

  def do_flatten([h|t], tail) when is_list(h) do
    do_flatten(h, do_flatten(t, tail))
  end

  def do_flatten([h|t], tail) do
    [h | do_flatten(t, tail)]
  end

  def do_flatten([], tail) do
    tail
  end
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
