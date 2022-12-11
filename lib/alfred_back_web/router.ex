defmodule AlfredBackWeb.Router do
  use AlfredBackWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AlfredBackWeb do
    pipe_through :api
    resources "/users", UsersController, only: [:create, :show, :delete, :update]
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: AlfredBackWeb.Telemetry
    end
  end

  scope "/", AlfredBackWeb do
    pipe_through :api

    get "/", WelcomeController, :index
  end
end
