defmodule Eshop.Companies.WarehouseVariantValue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "warehouse_variant_values" do
    field :native_value, :string
    field :value, :string
    belongs_to :warehouse_variant, Eshop.Companies.WarehouseVariant

    timestamps()
  end

  @doc false
  def changeset(warehouse_variant_value, attrs) do
    warehouse_variant_value
    |> cast(attrs, [:value, :native_value])
    |> validate_required([:value, :native_value])
    |> validate_length(:value, min: 1, max: 200)
    |> validate_length(:native_value, min: 1, max: 200)
  end
end
