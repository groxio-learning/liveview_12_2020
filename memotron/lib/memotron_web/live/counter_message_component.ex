defmodule MemotronWeb.CounterMessageComponent do
  use MemotronWeb, :live_component

  @impl true
  def update(%{message: _message} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
    }
  end

  @impl true
  def render(assigns) do
    ~L"""
    <h1><%= @message %></h1>
    """
  end
end
