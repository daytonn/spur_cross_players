# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :spur_cross_players,
  ecto_repos: [SpurCrossPlayers.Repo],
  generators: [binary_id: true],
  mailgun_private_api_key: System.get_env("MAILGUN_PRIVATE_API_KEY"),
  mailgun_public_api_key: System.get_env("MAILGUN_PUBLIC_API_KEY"),
  mailgun_webhook_signing_key: System.get_env("MAILGUN_WEBHOOK_SIGNING_KEY")

config :firebird,
  app_name: :spur_cross_players,
  generators: [binary_id: true]

# Configures the endpoint
config :spur_cross_players, SpurCrossPlayersWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: SpurCrossPlayersWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SpurCrossPlayers.PubSub,
  live_view: [signing_salt: "FC0aFBgr"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :spur_cross_players, SpurCrossPlayers.Mailer,
  adapter: Bamboo.MailgunAdapter,
  api_key: System.get_env("MAILGUN_PRIVATE_API_KEY"),
  domain: System.get_env("MAILGUN_DOMAIN"),
  hackney_opts: [
    recv_timeout: :timer.minutes(1)
  ]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
