defmodule MemotronWeb.PageController do
  use MemotronWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
