defmodule ExrestWeb.PostController do
  use ExrestWeb, :controller
  alias Exrest.Posts
  alias Exrest.Posts.Post
  alias ExrestWeb.Utils

  def ping(conn, _params) do
    conn
    |> render("ack.json", %{success: true, message: "Pong"})
  end

  def create(conn, params) do
    case params |> Posts.create_post() do
      {:ok, %Post{} = _post} ->
        conn |> render("ack.json", %{success: true, message: "Post created"})

      {:error, %Ecto.Changeset{} = changeset} ->
        conn |> render("errors.json", %{errors: Utils.format_changeset_errors(changeset)})

      _ ->
        conn |> render("error", %{error: Utils.internal_server_error()})
    end
  end

  def get_all(conn, _params) do
    conn |> render("data.json", %{success: true, data: Posts.list_posts()})
  end

end
