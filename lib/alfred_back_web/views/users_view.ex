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
end
