defmodule AlfredBack.Repo do
  use Ecto.Repo,
    otp_app: :alfred_back,
    adapter: Ecto.Adapters.Postgres
end
