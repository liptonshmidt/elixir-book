defmodule MyList do
  def mapsum([], _f), do: 0
  def mapsum([head | tail], f), do: f.(head) + mapsum(tail, f)
end

IO.puts MyList.mapsum [1, 2, 3], &(&1 * &1)
