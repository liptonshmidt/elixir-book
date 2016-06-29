# Implement and run a function sum(n) 
# that uses recursion to calculate 
# the sum of the integers from 1 to n. 
# You’ll need to write this function inside a module in a separate file. 
# Then load up iex, compile that file, and try your function.

defmodule Recursive do
  def sum(1), do: 1
  def sum(n), do: n + sum(n-1)
end
