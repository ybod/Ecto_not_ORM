defmodule Blog.User do
  use Ecto.Schema

  schema "users" do
    field  :name, :string
    field  :reputation, :integer, default: 0

    has_many :posts, Blog.Post, on_delete: :delete_all

    timestamps
  end
end
