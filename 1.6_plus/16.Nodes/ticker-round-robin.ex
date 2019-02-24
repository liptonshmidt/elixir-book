defmodule Ticker do
  @interval 2000
  @name :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [[], 0])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send :global.whereis_name(@name), {:register, client_pid}
  end

  def generator(clients, tick_num) do
    receive do
      {:register, pid} ->
        IO.puts "registering #{inspect pid}"
        generator([pid | clients], tick_num)
    after
      @interval ->
        IO.puts "tick: #{inspect tick_num}"

        if Enum.any?(clients) do
          client = Enum.at clients, rem(tick_num, Enum.count(clients))
          send client, {:tick, tick_num}
        end

        generator(clients, tick_num + 1)
    end
  end
end

defmodule Client do
  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Ticker.register(pid)
  end

  def receiver do
    receive do
      {:tick, tick_num} ->
        IO.puts "tock in client: #{inspect tick_num}"
        receiver()
    end
  end
end
