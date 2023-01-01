defmodule SpurCrossPlayers.Repos.Invitations do
  use EctoResource

  import Ecto.Query, warn: false

  alias SpurCrossPlayers.Repo
  alias SpurCrossPlayers.Schemas.Invitation

  using_repo(Repo) do
    resource(Invitation)
  end
end
