# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :live_demo, LiveDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "s9EA73vVxNzoyPlLDln+bVJgceU3AxJSfzfkvmalmxREqvv10G9nRytsGTAHvWf9",
  render_errors: [view: LiveDemoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LiveDemo.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "VQ+PKE/GsQPzk9E6Hi2BhgLxjYhFDQJT"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
