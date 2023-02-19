defmodule SpurCrossPlayers.Repo.Migrations.AddStreetAddressToProfiles do
  use Ecto.Migration

  def change do
    alter table(:profiles) do
      add :street_address, :string, null: false
    end
  end
end
