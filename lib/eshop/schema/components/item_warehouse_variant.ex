defmodule Eshop.Components.ItemWarehouseVariant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "item_warehouse_variants" do
    belongs_to :item, Eshop.Objects.Item
    belongs_to :warehouse_variant, Eshop.Companies.WarehouseVariant
    belongs_to :warehouse_variant_value, Eshop.Companies.WarehouseVariantValue

    timestamps()
  end

  @doc false
  def changeset(item_warehouse_variant, attrs) do
    item_warehouse_variant
    |> cast(attrs, [:item_id, :warehouse_variant_id, :warehouse_variant_value_id])
    |> validate_required([:item_id, :warehouse_variant_id, :warehouse_variant_value_id])
  end
end
