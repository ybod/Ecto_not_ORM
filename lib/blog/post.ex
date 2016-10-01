defmodule Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field  :title, :string
    field  :body, :string
    field  :pinned, :boolean, default: false

    belongs_to :user, Blog.User
    has_many :comments, Blog.Comment, on_delete: :delete_all

    timestamps
  end

  def changeset(post, params \\ %{}) do
    post
    |> cast(params, [:title, :body, :pinned, :user_id])
    |> validate_required([:title, :body, :user_id])
  end
end
