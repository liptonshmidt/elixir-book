defmodule MyList do
  def span(from, to) when from > to, do: []
  def span(from, from), do: [from]
  def span(from, to) when from < to do
    [from | span(from+1, to)]
  end

  def primes(n) do
    for num <- span(2, n), is_prime?(num), do: num
  end

  defp is_prime?(2), do: true
  defp is_prime?(num) do
    check_upto = trunc(:math.sqrt(num))
    Enum.all?(span(2, check_upto), &(divided_by(num, &1)))
  end

  defp divided_by(x, y) do
    # inspect square root optimisation
    IO.inspect "#{x} #{y}"
    rem(x, y) != 0
  end
end

IO.inspect MyList.primes(12)
