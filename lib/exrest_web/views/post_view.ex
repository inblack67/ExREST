defmodule ExrestWeb.PostView do
  use ExrestWeb, :view

  def render("ack.json", %{success: success, message: message}), do: %{success: success, message: message}
end
