defmodule AlfredBackWeb.UsersController do
  use AlfredBackWeb, :controller

  action_fallback AlfredBackWeb.FallbackController

  def create(conn, params) do
    params
    |> AlfredBack.create_user()
    |> handle_response(conn, "create.json", :created)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> AlfredBack.delete_user()
    |> handle_delete(conn)
  end

  def show(conn, %{"id" => id}) do
    id
    |> AlfredBack.fetch_user()
    |> handle_response(conn, "show.json", :ok)
  end

  def index(conn, _params) do
    AlfredBack.fetch_user()
    |> handle_response(conn, "index.json", :ok)
  end

  def update(conn, params) do
    params
    |> AlfredBack.update_user()
    |> handle_response(conn, "update.json", :ok)
  end

  defp handle_delete({:ok, _User}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error, _reason} = error, _conn), do: error

  defp handle_response({:ok, user}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, user: user)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
