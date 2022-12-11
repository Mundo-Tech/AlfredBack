defmodule AlfredBack.InstallmentsBasis.Schemas.User.Delete do
  alias Ecto.UUID
  alias AlfredBack.InstallmentsBasis.Schemas.User
  alias AlfredBack.Repo

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invaled ID format!"}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case fetch_user(uuid) do
      nil -> {:error, "User not found!"}
      user -> Repo.delete(user)
    end
  end

  defp fetch_user(uuid), do: Repo.get(User, uuid)
end
