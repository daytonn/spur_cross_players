defmodule SpurCrossPlayers.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles, primary_key: false) do
      add :id, :binary_id, null: false
      add :firstname, :text, null: false
      add :lastname, :text, null: false
      add :birthday, :date, null: false
      add :phone_number, :text, null: false
      
      timestamps()
    end

  end
end
