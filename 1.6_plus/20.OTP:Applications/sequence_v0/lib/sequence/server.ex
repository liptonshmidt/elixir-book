defmodule Sequence.Server do
  use GenServer
  require Logger

  @vsn "1"

  defmodule State do
    defstruct(current_number: 0, delta: 1)
  end
  
  #####
  # External API  

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def next_number do
    with number = GenServer.call(__MODULE__, :next_number), do: "The next number is #{number}"
  end

  def increment_number(delta) do
    GenServer.cast __MODULE__, {:increment_number, delta}
  end

  # to test reliability of data processing and check OTP recovery
  def crash_server do
    GenServer.cast __MODULE__, :crash_server
  end

  #####
  # GenServer implementation

  def init(_) do
    [n, d] = Sequence.Stash.get()
    state = %State{ current_number: n, delta: d }
    { :ok, state }
  end
  
  def handle_call(:next_number, _from, state = %{current_number: n}) do
    { :reply, n, %{state | current_number: n + state.delta} }
  end

  def handle_cast({:increment_number, delta}, state) do
    { :noreply, %{state | delta: delta}}
  end

  def handle_cast(:crash_server, _state) do
    raise "Manually triggered exception!"
  end

  def terminate(_reason, %{current_number: n, delta: d}) do
    Sequence.Stash.update([n, d])
  end

  def code_change("0", old_state = current_number, _extra) do
    new_state = %State{
      current_number: current_number,
      delta: 1
    }
    Logger.info "Changing code from 0 to 1"
    Logger.info inspect(old_state)
    Logger.info inspect(new_state)
    {:ok, new_state}
  end

  def code_change("1", state, _extra) do
    {:ok, state}
  end

  def code_change(_version, state, _extra) do
    {:ok, state}
  end
end
