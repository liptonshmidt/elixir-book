defmodule Link1 do
  import :timer, only: [sleep: 1]

  def sad_function do
    sleep(500)
    exit(:boom)
  end

  def run do
    # Process.flag(:trap_exit, true) # ver 3 with spawn_link
    # spawn_link(Link1, :sad_function, []) # ver 2 && 3
    # spawn(Link1, :sad_function, []) # ver 1

    spawn_monitor(Link1, :sad_function, []) # ver 4

    receive do
      msg ->
        IO.puts "Message received: #{inspect msg}"
      after 1000 ->
        IO.puts "Nothing happened"
    end
  end
end
