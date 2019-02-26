defmodule Stack.Server do
  use GenServer

  def init(initial_contents) do
    {:ok, initial_contents}
  end

  def handle_call(:pop, _from, contents) do
    [h|t] = contents
    {:reply, h, t}
  end
end
