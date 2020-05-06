defmodule Eshop.Components.UnitType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "unit_types" do
    field :name, :string
    field :native_name, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(unit_type, attrs) do
    unit_type
    |> cast(attrs, [:name, :native_name])
    |> validate_required([:name, :native_name])
  end
end
