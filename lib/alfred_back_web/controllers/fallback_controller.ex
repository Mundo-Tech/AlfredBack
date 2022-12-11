defmodule AlfredBackWeb.FallbackController do
  use AlfredBackWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(AlfredBackWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
