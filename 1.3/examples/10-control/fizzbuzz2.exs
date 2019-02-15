# More functional approach (using pattern matching instead of cond)
#
#
# In the game of FizzBuzz, children count up from 1.
# If the number is a multiple of three, they say “Fizz.”
# For multiples of five, they say “Buzz.”
# For multiples of both, they say “FizzBuzz.”
# Otherwise, they say the number

defmodule FizzBuzz do
  def upto(n) when n > 0 do
    1..n |> Enum.map(&phrase/1)
  end

  def phrase(n), do: _phrase(n, rem(n,3), rem(n,5))

  defp _phrase(_n, 0, 0), do: "FizzBuzz"
  defp _phrase(_n, 0, _), do: "Fizz"
  defp _phrase(_n, _, 0), do: "Buzz"
  defp _phrase( n, _, _), do: n
end

IO.inspect FizzBuzz.upto(20)
