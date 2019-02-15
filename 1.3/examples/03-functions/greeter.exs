greeter = fn (name)->
  fn -> "Hello, #{name}" end
end

mr_robot_greeter = greeter.("Mr Robot")
IO.puts mr_robot_greeter.()
