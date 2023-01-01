defmodule SpurCrossPlayers.Schemas.Invitation do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "invitations" do
    field :account_id, :binary_id
    field :code, :string
    field :status, :string
    field :invitee_info, :string
    field :info_type, :string

    timestamps()
  end

  @doc false
  def changeset(invitation, attrs) do
    invitation
    |> cast(attrs, [:code, :status, :invitee_info, :info_type])
    |> validate_required([:code, :status, :invitee_info, :info_type])
  end
end
