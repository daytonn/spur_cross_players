defmodule SpurCrossPlayersWeb.Router do
  use SpurCrossPlayersWeb, :router

  import SpurCrossPlayersWeb.AccountAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {SpurCrossPlayersWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_account
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SpurCrossPlayersWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", SpurCrossPlayersWeb do
  #   pipe_through :api
  # end

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
      pipe_through :browser
      live_dashboard "/dashboard", metrics: SpurCrossPlayersWeb.Telemetry
    end
  end

  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    forward "/mailbox", Bamboo.SentEmailViewerPlug

    scope "/dev" do
      pipe_through :browser
    end
  end

  ## Authentication routes

  scope "/", SpurCrossPlayersWeb do
    pipe_through [:browser, :redirect_if_account_is_authenticated]

    get "/accounts/register", AccountRegistrationController, :new
    post "/accounts/register", AccountRegistrationController, :create
    get "/accounts/log_in", AccountSessionController, :new
    post "/accounts/log_in", AccountSessionController, :create
    get "/accounts/reset_password", AccountResetPasswordController, :new
    post "/accounts/reset_password", AccountResetPasswordController, :create
    get "/accounts/reset_password/:token", AccountResetPasswordController, :edit
    put "/accounts/reset_password/:token", AccountResetPasswordController, :update
  end

  scope "/", SpurCrossPlayersWeb do
    pipe_through [:browser, :require_authenticated_account]

    get "/accounts/settings", AccountSettingsController, :edit
    put "/accounts/settings", AccountSettingsController, :update
    get "/accounts/settings/confirm_email/:token", AccountSettingsController, :confirm_email
  end

  scope "/", SpurCrossPlayersWeb do
    pipe_through [:browser]

    delete "/accounts/log_out", AccountSessionController, :delete
    get "/accounts/confirm", AccountConfirmationController, :new
    post "/accounts/confirm", AccountConfirmationController, :create
    get "/accounts/confirm/:token", AccountConfirmationController, :edit
    post "/accounts/confirm/:token", AccountConfirmationController, :update
  end
end
