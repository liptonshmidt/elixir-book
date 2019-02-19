defmodule MyList do
  def span(from, to) when from > to, do: []
  def span(from, to), do: [from | span(from+1, to)]

  def primes_from_2_to(n) when n >= 2 do
    Enum.filter(span(2, n), &is_prime?(&1))
  end

  def is_prime?(x) when x >= 2 do
    max_div = floor :math.sqrt(x)
    Enum.all?(span(2, max_div), &(rem(x, &1) != 0))
  end
end

IO.puts "#span:"
IO.inspect MyList.span(0, 0)
IO.inspect MyList.span(0, -5)
IO.inspect MyList.span(0, 5)

IO.puts "#primes:"
IO.inspect MyList.primes_from_2_to(2)
IO.inspect MyList.primes_from_2_to(100)
