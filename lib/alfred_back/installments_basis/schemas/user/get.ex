defmodule AlfredBack.InstallmentsBasis.Schemas.User.Get do
  alias Ecto.UUID
  alias AlfredBack.InstallmentsBasis.Schemas.User
  alias AlfredBack.Repo

  def call() do
    list = Repo.all(User)
    {:ok, list}
  end

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invaled ID format!"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(User, uuid) do
      nil -> {:error, "User not found!"}
      user -> {:ok, user}
    end
  end
end
