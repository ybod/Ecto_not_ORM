defmodule Blog.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :body, :text
      add :pinned, :boolean
      add :user_id, references(:users)

      timestamps  #inserted_at, updated_at
    end
  end
end
