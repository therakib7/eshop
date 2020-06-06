defmodule Eshop.Components.UnitType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "unit_types" do
    field :name, :string
    field :native_name, :string
    belongs_to :user, Eshop.Users.User

    timestamps()
  end

  @doc false
  def changeset(unit_type, attrs) do
    unit_type
    |> cast(attrs, [:name, :native_name])
    |> validate_required([:name, :native_name])
    |> validate_length(:name, min: 2, max: 200)
    |> validate_length(:native_name, min: 2, max: 200)
  end
end
