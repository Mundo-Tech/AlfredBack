defmodule AlfredBackWeb.UsersController do
  use AlfredBackWeb, :controller

  action_fallback AlfredBackWeb.FallbackController

  def create(conn, params) do
    params
    |> AlfredBack.create_user()
    |> handle_response(conn)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> AlfredBack.delete_user()
    |> handle_delete(conn)
  end

  defp handle_delete({:ok, _User}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error, _reason} = error, _conn), do: error

  defp handle_response({:ok, user}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", user: user)
  end

  defp handle_response({:error, _changeset} = error, _conn), do: error
end
