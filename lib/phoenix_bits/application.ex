defmodule PhoenixBits.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhoenixBitsWeb.Telemetry,
      # Start the Ecto repository
      PhoenixBits.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhoenixBits.PubSub},
      # Start Finch
      {Finch, name: PhoenixBits.Finch},
      # Start the Endpoint (http/https)
      PhoenixBitsWeb.Endpoint,
      # Start a worker by calling: PhoenixBits.Worker.start_link(arg)
      # {PhoenixBits.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixBits.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixBitsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
