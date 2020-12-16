defmodule MemotronWeb.EraserLive do
  use MemotronWeb, :live_view
  alias Memotron.Eraser.Core

  @impl true
  def mount(_params, _session, socket) do
    text = "Did you try turning it off and on again?"
    steps = 3

    {:ok, assign(socket, text: text, steps: steps, eraser: Core.new(text, steps))}
  end

  @impl true
  def render(assigns) do
   ~L"""
   <H1>MemoTron</H1>
   <pre><%= @eraser.text %></pre>
   <button phx-click="erase">Erase!</button>
   <pre><%= inspect(@eraser) %></pre>
   """
  end

  # Event Handlers
  @impl true
  def handle_event("erase", _, socket) do
    {:noreply, socket |> erase }
  end

  defp erase(socket) do
    assign(socket, eraser: Core.erase(socket.assigns.eraser))
  end
end
