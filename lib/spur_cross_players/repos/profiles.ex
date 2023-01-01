defmodule SpurCrossPlayers.Repos.Profiles do
  use EctoResource

  import Ecto.Query, warn: false

  alias SpurCrossPlayers.Repo
  alias SpurCrossPlayers.Schemas.Profile

  using_repo(Repo) do
    resource(Profile)
  end
end
