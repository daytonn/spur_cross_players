defmodule SpurCrossPlayers.Schemas.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profiles" do
    field :first_name, :string
    field :last_name, :string
    field :phone_number, :string

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:first_name, :last_name, :phone_number])
    |> validate_required([:first_name, :last_name, :phone_number])
  end
end
