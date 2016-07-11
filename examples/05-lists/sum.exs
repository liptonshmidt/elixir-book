defmodule MyList do
  def sum(list), do: _sum(list, 0)

  defp _sum([], acc), do: acc
  defp _sum([head | tail], acc), do: _sum(tail, acc + head)
end

IO.puts MyList.sum([])
IO.puts MyList.sum([1])
IO.puts MyList.sum([1,2,3,4])
