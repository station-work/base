defmodule StationWorkWeb.PageController do
  use StationWorkWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
