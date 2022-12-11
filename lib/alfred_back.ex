defmodule AlfredBack do
  alias AlfredBack.InstallmentsBasis.Schemas.User

  defdelegate create_user(params), to: User.Create, as: :call
end
