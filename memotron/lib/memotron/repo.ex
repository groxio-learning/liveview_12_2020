defmodule Memotron.Repo do
  use Ecto.Repo,
    otp_app: :memotron,
    adapter: Ecto.Adapters.Postgres
end
