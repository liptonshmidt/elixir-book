defmodule MySpawn do
  import :timer, only: [sleep: 1]

  def message_to_parent_and_exit(parent_pid) do
    send parent_pid, "oh no"
    # exit(:boom)
    raise "error!"
  end

  def run do
    # spawn_link(MySpawn, :message_to_parent_and_exit, [self()])
    spawn_monitor(MySpawn, :message_to_parent_and_exit, [self()])

    sleep(500)

    wait_receive()
  end

  def wait_receive do
    receive do
      msg ->
        IO.puts "Received: #{inspect msg}"
        wait_receive()
    end
  end
end

MySpawn.run()
