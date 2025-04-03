defmodule PhoenixHelloWorld.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_hello_world,
    adapter: Ecto.Adapters.Postgres
end
