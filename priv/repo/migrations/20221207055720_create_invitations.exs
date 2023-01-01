defmodule SpurCrossPlayers.Repo.Migrations.CreateInvitations do
  use Ecto.Migration

  def change do
    create table(:invitations, primary_key: false) do
      add :id, :binary_id, null: false
      add :account_id, references("accounts", type: :uuid)
      add :status, :text, null: false, default: "created"
      add :invitee_info, :text, null: false
      add :info_type, :text, null: false, default: "email"

      timestamps()
    end

  end
end
