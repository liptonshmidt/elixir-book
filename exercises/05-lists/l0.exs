# Sum function without an accumulator

defmodule MyList do
  def sum([]), do: 0
  def sum([acc]), do: acc
  def sum([acc|[h|t]]), do: sum([acc+h|t])


  def sum2([]), do: 0
  def sum2([head|tail]), do: head + sum2(tail)
end

IO.puts MyList.sum([])
IO.puts MyList.sum([1])
IO.puts MyList.sum([1,2,3])

IO.puts MyList.sum2([])
IO.puts MyList.sum2([1])
IO.puts MyList.sum2([1,2,3])
