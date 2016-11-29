defmodule MyString do
  def printable_ascii?(str), do: Enum.all?(str, fn ch -> ch in ? ..?~ end)
end

IO.inspect MyString.printable_ascii?('cat!')    #=> true
IO.inspect MyString.printable_ascii?('∂x/∂y')   #=> false
