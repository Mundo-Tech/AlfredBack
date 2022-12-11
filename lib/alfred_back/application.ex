defmodule AlfredBack.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      AlfredBack.Repo,
      # Start the Telemetry supervisor
      AlfredBackWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: AlfredBack.PubSub},
      # Start the Endpoint (http/https)
      AlfredBackWeb.Endpoint
      # Start a worker by calling: AlfredBack.Worker.start_link(arg)
      # {AlfredBack.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AlfredBack.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AlfredBackWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
