defmodule MemotronWeb.PickerLive do
  use MemotronWeb, :live_view
  alias Memotron.Library

  @impl true
  def mount(_params, _session, socket) do
    {
      :ok,
      socket
      |> first_passage_id()
      |> get_passage()
    }
  end

  @impl true
  def render(assigns) do
   ~L"""
   <H1>MemoTron</H1>
   <pre><%= @passage.name %></pre>
   <button phx-click="previous">previous!</button>
   <button phx-click="next">next!</button>
   <pre><%= inspect(@passage.text) %></pre>

   <button phx-click="choose">Choose?</button>
   """
  end

  @impl true
  def handle_event("next", _meta, socket) do
    {:noreply, socket |> next |> get_passage}
  end

  def handle_event("previous", _meta, socket) do
    {:noreply, socket |> previous |> get_passage}
  end

  def handle_event("choose", _meta, socket) do
    {:noreply, push_redirect(socket, to: "/play/#{socket.assigns.id}")}
  end

  def get_passage(socket) do
    assign(socket, passage: Library.get_passage!(socket.assigns.id))
  end

  def first_passage_id(socket) do
    assign(socket, id: Library.get_first_id())
  end

  def next(socket) do
    assign(socket, id: Library.next(socket.assigns.id))
  end

  def previous(socket) do
    assign(socket, id: Library.previous(socket.assigns.id))
  end
end
