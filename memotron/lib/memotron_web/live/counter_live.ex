defmodule MemotronWeb.CounterLive do
  use MemotronWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 42)}
  end

  def render(assigns) do
   ~L"""
   <H1>Your Count <%= @count %> </H1>
   """
  end
end
