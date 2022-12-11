defmodule AlfredBackWeb.UsersController do
  use AlfredBackWeb, :controller

  action_fallback AlfredBackWeb.FallbackController

  def create(conn, params) do
    params
    |> AlfredBack.create_user()
    |> handle_response(conn)
  end

  defp handle_response({:ok, user}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", user: user)
  end

  defp handle_response({:error, _changeset} = error, _conn), do: error
end
