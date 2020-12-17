defmodule MemotronWeb.EraserLive do
  use MemotronWeb, :live_view
  alias Memotron.Eraser.Core
  alias Memotron.Library

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    passage = Library.get_passage!(id)

    {
      :ok,
      assign(socket,
        text: passage.text,
        steps: passage.steps,
        eraser: Core.new(passage.text, passage.steps)
      )
    }
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
    {:noreply, socket |> erase}
  end

  defp erase(socket) do
    assign(socket, eraser: Core.erase(socket.assigns.eraser))
  end
end
