defmodule SpurCrossPlayers.Schemas.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "profiles" do
    field :firstname, :string
    field :lastname, :string
    field :birthday, :date
    field :phone_number, :string

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:firstname, :lastname, :birthday, :phone_number])
    |> validate_required([:firstname, :lastname, :birthday, :phone_number])
  end
end
