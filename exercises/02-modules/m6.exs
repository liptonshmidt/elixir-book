# the very first solution
defmodule Chop do
  def guess(actual, a..b) when a == b do
    IO.puts actual
  end

  def guess(actual, a..b) when actual in a..b do
    m = div (a+b), 2
    IO.puts "Is it #{m}?"
    help(actual, a..b, m)
  end

  def help(actual, a..b, m) when actual > m do
    guess(actual, (m+1)..b) 
  end

  def help(actual, a..b, m) when actual <= m do
    guess(actual, a..m) 
  end
end

Chop.guess(273, 1..1000)
