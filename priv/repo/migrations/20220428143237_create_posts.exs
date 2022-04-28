defmodule Exrest.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string, null: false
      add :desc, :string, null: false
      add :content, :text, null: false

      timestamps()
    end

    create unique_index(:posts, :title)
  end
end
