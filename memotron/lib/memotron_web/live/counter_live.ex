defmodule MemotronWeb.CounterLive do
  use MemotronWeb, :live_view
  alias Memotron.Core

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: Core.new(42))}
  end

  # Event Handlers
  @impl true
  def handle_event("fast_increment", _, socket) do
    {:noreply, socket |> inc() |> inc() }
  end
  @impl true
  def handle_event("count", %{"value" => %{"direction" => "up"}},socket) do
    {:noreply, socket |> inc() }
  end

  @impl true
  def handle_event("count", %{"value" => %{"direction" => "down"}},socket) do
    {:noreply, socket |> dec() }
  end

  @impl true
  def handle_event("fast_decrement", _, socket) do
    {:noreply, socket |> dec() |> dec() }
  end

  # Event Handlers
  @impl true
  def handle_event("increment", _, socket) do
    {:noreply, inc(socket)}
  end

  @impl true
  def handle_event("decrement", _, socket) do
    {:noreply, dec(socket)}
  end

  # Private Functions
  defp inc(socket) do
    assign(socket, count: Core.increment(socket.assigns.count))
  end

  defp dec(socket) do
    assign(socket, count: Core.decrement(socket.assigns.count))
  end
end
