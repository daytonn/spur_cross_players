defmodule SpurCrossPlayersWeb.PageController do
  use SpurCrossPlayersWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
