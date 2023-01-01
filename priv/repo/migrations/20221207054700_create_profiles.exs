defmodule MyApp.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :first_name, :text, null: false
      add :last_name, :text, null: false
      add :phone_number, :text, null: false
      add :account_id, references("accounts", type: :uuid)
      
      timestamps()
    end

  end
end
