defmodule PhoenixBits.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_bits,
    adapter: Ecto.Adapters.Postgres
end
