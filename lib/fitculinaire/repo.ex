defmodule Fitculinaire.Repo do
  use Ecto.Repo,
    otp_app: :fitculinaire,
    adapter: Ecto.Adapters.Postgres
end
