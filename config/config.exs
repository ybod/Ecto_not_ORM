# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :blog, Blog.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "blog_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :blog, ecto_repos: [Blog.Repo]
