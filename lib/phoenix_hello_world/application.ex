defmodule PhoenixHelloWorld.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhoenixHelloWorldWeb.Telemetry,
      PhoenixHelloWorld.Repo,
      {DNSCluster,
       query: Application.get_env(:phoenix_hello_world, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhoenixHelloWorld.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PhoenixHelloWorld.Finch},
      # Start a worker by calling: PhoenixHelloWorld.Worker.start_link(arg)
      # {PhoenixHelloWorld.Worker, arg},
      # Start to serve requests, typically the last entry
      PhoenixHelloWorldWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixHelloWorld.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixHelloWorldWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
