# Extend the Times module with a triple function that multiplies its parameter by three.
# Add a quadruple function. (Maybe it could call the double function....)

defmodule Times do
  def double(n), do: n*2
  def triple(n), do: n * 3
  def quadraple(n), do: double double n
end
