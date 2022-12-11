defmodule AlfredBack.InstallmentsBasis.Schemas.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "users" do
    field :name, :string
    field :username, :string
    field :email, :string
    field :created_by, :string
    field :edited_by, :string
    field :role, :integer
    field :password_hash, :string
    field :password, :string, virtual: true
    timestamps(inserted_at: :created_at)
  end

  # @required_params [:name, :username, :email, :created_by, :edited_by, :role, :password]
  @required_params [:username, :email, :created_by, :edited_by, :role, :password]
  @optional_params [:name, :edited_by]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params ++ @optional_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 8)
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_pass_hash(changeset), do: changeset
end
