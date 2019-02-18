rem_fb = fn
  (0, 0, _) -> 'FizzBuzz'
  (0, _, _) -> 'Fizz'
  (_, 0, _) -> 'Buzz'
  (_, _, z) -> z
end

IO.puts rem_fb.(0, 0, 1)
IO.puts rem_fb.(0, 1, 2)
IO.puts rem_fb.(1, 0, 2)
IO.puts rem_fb.(1, 2, 3)
