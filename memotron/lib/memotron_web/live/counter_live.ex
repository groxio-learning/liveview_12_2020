defmodule MemotronWeb.CounterLive do
  use MemotronWeb, :live_view
  alias Memotron.Counter

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 42)}
  end

  def render(assigns) do
   ~L"""
   <H1>Your Count <%= @count %> </H1>
   <button phx-click="increment">RE-UP</button>
   """
  end

  def handle_event("increment", _, socket) do
    {:noreply, inc(socket)}
  end

  defp inc(socket) do
    assign(socket, count: Counter.increment(socket.assigns.count))
  end
end
