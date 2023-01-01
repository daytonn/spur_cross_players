defmodule SpurCrossPlayers.Repo do
  use Ecto.Repo,
    otp_app: :spur_cross_players,
    adapter: Ecto.Adapters.Postgres
end
