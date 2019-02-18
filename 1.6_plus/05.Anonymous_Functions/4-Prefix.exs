prefix = fn p -> (fn s -> "#{p} #{s}"end) end

mr = prefix.("Mr")
IO.puts mr.("Lipton")
IO.puts prefix.("Doctor").("Who")
