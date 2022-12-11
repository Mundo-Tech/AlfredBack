defmodule AlfredBackWeb.WelcomeController do
  use AlfredBackWeb, :controller

  def index(conn, _params) do
    text(conn, "welcome to the alfred api")
  end
end
