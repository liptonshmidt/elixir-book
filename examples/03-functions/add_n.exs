add_n = fn n -> fn other -> other + n end end

add_two = add_n.(2)
add_five =  add_n.(5)

IO.puts add_two.(2)
IO.puts add_two.(3)

IO.puts add_five.(0)
IO.puts add_five.(5)
