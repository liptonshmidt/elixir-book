# The operator rem(a, b) returns the remainder after dividing a by b.
# Write a function that takes a single integer (n)
# and calls the function in the previous exercise,
# passing it rem(n,3), rem(n,5), and n.
# Call it seven times with the arguments 10, 11, 12, and so on. 
# You should get “Buzz, 11, Fizz, 13, 14, FizzBuzz, 16.”

fizz_buzz = fn
  (0, 0, _) -> "FizzBuzz."
  (0, _, _) -> "Fizz."
  (_, 0, _) -> "Buzz."
  (_, _, x) -> x
end

fbr = fn n -> fizz_buzz.(rem(n,3), rem(n,5), n) end

IO.puts fbr.(10)
IO.puts fbr.(11)
IO.puts fbr.(12)
IO.puts fbr.(13)
IO.puts fbr.(14)
IO.puts fbr.(15)
IO.puts fbr.(16)
