# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :eshop,
  ecto_repos: [Eshop.Repo]

# Configures the endpoint
config :eshop, EshopWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XeyjnGdJ2mORNoGKxw+9tfhl4+a3XYCyYGeEuvavHh8Rm7pPVhbM4p5ln3ZOsYCj",
  render_errors: [view: EshopWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Eshop.PubSub,
  live_view: [signing_salt: "N6HZUDAx"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :eshop, Eshop.Guardian,
  issuer: "eshop",
  verify_module: Guardian.JWT,
  ttl: {30, :days},
  auth_time: true,
  allowed_drift: 2000,
  allowed_algos: ["HS512"],
  secret_key: "DJMITTwb0aO0MLmxWfbQZSprPfHOBiXHwd2+S8HvCi88slKqrk5tBwF5e+2EhNr0",
  serializer: Eshop.Guardian

config :guardian, Guardian.DB,
  # Add your repository module
  repo: Eshop.Repo,
  # default
  schema_name: "guardian_tokens",
  # token_types: ["refresh_token"], # store all token types if not set
  # default: 60 minutes
  sweep_interval: 60
