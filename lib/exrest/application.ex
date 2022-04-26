defmodule Exrest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Exrest.Repo,
      # Start the Telemetry supervisor
      ExrestWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Exrest.PubSub},
      # Start the Endpoint (http/https)
      ExrestWeb.Endpoint
      # Start a worker by calling: Exrest.Worker.start_link(arg)
      # {Exrest.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Exrest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ExrestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
