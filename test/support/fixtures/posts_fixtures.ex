defmodule Exrest.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Exrest.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        content: "some content",
        desc: "some desc",
        title: "some title"
      })
      |> Exrest.Posts.create_post()

    post
  end
end
