Stream.unfold({0, 1}, fn {x, y} -> {x, {y, x+y}} end) |> Enum.take(10)
