defmodule AlfredBack do
  alias AlfredBack.InstallmentsBasis.Schemas.User

  defdelegate create_user(params), to: User.Create, as: :call
  defdelegate delete_user(params), to: User.Delete, as: :call
  defdelegate fetch_user(params), to: User.Get, as: :call
  defdelegate update_user(params), to: User.Update, as: :call
  defdelegate fetch_user(), to: User.Get, as: :call
end
