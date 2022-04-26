defmodule Exrest.Repo do
  use Ecto.Repo,
    otp_app: :exrest,
    adapter: Ecto.Adapters.Postgres
end
