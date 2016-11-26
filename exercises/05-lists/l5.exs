# Implement the following Enum functions
# using no library functions or list comprehensions:
# all?, each, filter, split, and take.

defmodule MyList do
  def all?(list), do: all?(list, fn x -> !!x end)
  def all?([], _f), do: true
  def all?([ h | t ], f) do
    f.(h) && all?(t, f)
  end

  def each([], _f), do: []
  def each([h | t], f) do
    [ f.(h) | each(t, f) ]
  end

  def filter([], _f), do: []
  def filter([h | t], f) do
    if f.(h) do
      [h | filter(t, f)]
    else
      filter(t, f)
    end
  end

  # From Enum docs:
  # split(enumerable, count)
  # Splits the enumerable into two enumerables, leaving count elements in the first one. 
  # If count is a negative number, it starts counting from the back to the beginning of the enumerable
  def split(list, count) when count < 0, do: split(Enum.reverse(list), -count)
  def split(list, count), do: _split(list, count, [])

  def _split([], count, collected) do
    [collected, []]
  end

  def _split(list, count, collected) do
    # IO.inspect "########"
    # IO.inspect collected

    if count > 0 do
      [h | t] = list
      # raise "#{h}"
      new_collected = collected ++ [h]
      # IO.inspect new_collected
      _split(t, count - 1, new_collected)
    else
      [collected, list]
    end
  end
end


# all? specs
IO.inspect MyList.all?([])
IO.inspect MyList.all?([1, 2, 3])
IO.inspect MyList.all?([true, true])
IO.inspect MyList.all?([true, false])
IO.inspect MyList.all?([], &(&1 > 0))
IO.inspect MyList.all?([-1,0,1], &(&1 > 0))
IO.inspect MyList.all?([1,2,3], &(&1 > 0))





# each specs
MyList.each([], &(IO.puts &1))
MyList.each([1, 2, 3], &(IO.puts &1))





# filter specs
IO.inspect MyList.filter([1,2,3,4], &(&1 > 2))




# split specs
IO.inspect "split!"

IO.inspect MyList.split([1, 2, 3, 4, 5, 6], 3)
# => [1, 2, 3], [4, 5, 6]

IO.inspect MyList.split([1, 2, 3], 0)
# => [], [1, 2, 3]

IO.inspect MyList.split([1, 2, 3], 3)
# => [1, 2, 3], []

IO.inspect MyList.split([1, 2, 3], 10)
# => [1, 2, 3], []

IO.inspect MyList.split([1, 2, 3], -1)
# => [3], [2, 1]
