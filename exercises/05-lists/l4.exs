# Write a function MyList.span(from, to)
# that returns a list of the numbers from from up to to.

defmodule MyList do
  # my first attempt
  def span(from, to) when from > to, do: raise "Wrong params (from should be <= to)"
  def span(x, x), do: [x]
  def span(from, to) do
    [from | span(from+1, to)]
  end

  # Dave's solution
  def span2(from, to) when from > to, do: []
  def span2(from, to), do: [from | span2(from+1, to)]
end


IO.inspect MyList.span2(1, 5)
IO.inspect MyList.span2(-5, 5)
IO.inspect MyList.span2(0, 0)
IO.inspect MyList.span2(5, -5)

# IO.inspect MyList.span(1, 5)
# IO.inspect MyList.span(-5, 5)
# IO.inspect MyList.span(0, 0)
# IO.inspect MyList.span(5, -5)
