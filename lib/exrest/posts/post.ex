defmodule Exrest.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :content, :string
    field :desc, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :desc, :content])
    |> validate_required([:title, :desc, :content])
    |> validate_length(:title, min: 3, max: 30)
    |> validate_length(:desc, min: 5, max: 30)
    |> unique_constraint(:title)
  end
end
