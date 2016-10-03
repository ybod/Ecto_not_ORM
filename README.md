# Ecto in not an ORM

This repository is an Elixir project used in my talk for 3rd Kyiv Elixir Meetup. You can find presentation itself in the root folder of the project: `Ecto_is_not_an_ORM.pdf`

## Instructions

  1. `mix ecto.create`
  2. `mix ecto.migrate`
  3. You can edit `priv\repo\seeds.exs` and run `mix run priv\repo\seeds.exs` to seed the DB
  4. You can edit and run `mix run priv\try_me.exs` to test Your Ecto code
  5. You can drop DB with `mix ecto.drop` anytime and start from playing again
