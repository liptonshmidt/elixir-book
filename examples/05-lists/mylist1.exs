defmodule MyList do
  def square([]), do: []
  def square([head | tail]), do: [head * head | square(tail) ]
end

IO.inspect MyList.square([])
IO.inspect MyList.square([1])
IO.inspect MyList.square([1, 2, 3, 4])
