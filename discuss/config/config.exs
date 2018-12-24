# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :discuss,
  ecto_repos: [Discuss.Repo]

# Configures the endpoint
config :discuss, Discuss.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "t0wst+xmvH10kCZuD4+bKBQr0wslwAjDmMY3l3WD2NJQAuCxyCp9+Yd10Ey7Ajgv",
  render_errors: [view: Discuss.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Discuss.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, [default_scope: "user,public_repo,notifications", allow_private_emails: true]}
  ]

# No worries, I revoked them 👻
config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "0cd263bc28607cdeaad9",
  client_secret: "3eac7ea62d75e251a8639f8f405838d1599ee66c"
  # client_id: System.get_env("GITHUB_CLIENT_ID"),
  # client_secret: System.get_env("GITHUB_CLIENT_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
