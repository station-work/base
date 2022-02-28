defmodule StationWork.Repo do
  use Ecto.Repo,
    otp_app: :station_work,
    adapter: Ecto.Adapters.Postgres
end
