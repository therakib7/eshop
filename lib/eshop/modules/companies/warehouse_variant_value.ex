defmodule Eshop.Companies.WarehouseVariantValue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "warehouse_variant_values" do
    field :native_value, :string
    field :value, :string
    field :warehouse_variant_id, :id

    timestamps()
  end

  @doc false
  def changeset(warehouse_variant_value, attrs) do
    warehouse_variant_value
    |> cast(attrs, [:value, :native_value])
    |> validate_required([:value, :native_value])
  end
end
