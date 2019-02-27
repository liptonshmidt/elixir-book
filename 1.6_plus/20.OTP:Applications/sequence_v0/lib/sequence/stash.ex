defmodule Sequence.Stash do
  use GenServer
  require Logger

  @vsn "1"

  @me __MODULE__
  
  def start_link([initial_number, initial_delta]) do
    GenServer.start_link(__MODULE__, [initial_number, initial_delta], name: @me)
  end

  def get() do
    GenServer.call(@me, { :get })
  end
  
  def update([new_number, new_delta]) do
    GenServer.cast(@me, { :update, [new_number, new_delta] })
  end

  # Server implementation
  
  def init([initial_number, initial_delta]) do
    { :ok, [initial_number, initial_delta] }
  end

  def handle_call({ :get }, _from, [n, d] ) do
    { :reply, [n, d], [n,d] }
  end

  def handle_cast({ :update, [n,d] }, _current_state) do
    { :noreply, [n,d] }
  end
end
