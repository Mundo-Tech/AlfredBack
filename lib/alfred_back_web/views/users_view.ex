defmodule AlfredBackWeb.UsersView do
  use AlfredBackWeb, :view
  alias AlfredBack.InstallmentsBasis.Schemas.User

  def render("create.json", %{
        user: %User{
          id: id,
          name: name,
          username: username,
          email: email,
          created_by: created_by,
          edited_by: edited_by,
          role: role,
          password_hash: password_hash
        }
      }) do
    %{
      message: "User created",
      user: %{
        id: id,
        name: name,
        username: username,
        email: email,
        created_by: created_by,
        edited_by: edited_by,
        role: role,
        password_hash: password_hash
      }
    }
  end

  def render("show.json", %{
        user: %User{
          id: id,
          name: name,
          username: username,
          email: email,
          created_by: created_by,
          edited_by: edited_by,
          role: role,
          password_hash: password_hash
        }
      }) do
    %{
      id: id,
      name: name,
      username: username,
      email: email,
      created_by: created_by,
      edited_by: edited_by,
      role: role,
      password_hash: password_hash
    }
  end

  def render("index.json", %{user: users})
      when is_list(users) do
    Enum.map(users, fn user ->
      %{
        id: user.id,
        name: user.name,
        username: user.username,
        email: user.email,
        created_by: user.created_by,
        edited_by: user.edited_by,
        role: user.role,
        password_hash: user.password_hash
      }
    end)
  end

  def render("update.json", %{
        user: %User{
          id: id,
          name: name,
          username: username,
          email: email,
          created_by: created_by,
          edited_by: edited_by,
          role: role,
          password_hash: password_hash
        }
      }) do
    %{
      message: "User updated",
      user: %{
        id: id,
        name: name,
        username: username,
        email: email,
        created_by: created_by,
        edited_by: edited_by,
        role: role,
        password_hash: password_hash
      }
    }
  end
end
