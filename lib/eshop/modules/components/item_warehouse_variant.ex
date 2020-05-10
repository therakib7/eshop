defmodule Eshop.Components.ItemWarehouseVariant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "item_warehouse_variants" do
    field :item_id, :id
    field :warehouse_variant_id, :id
    field :warehouse_variant_value_id, :id

    timestamps()
  end

  @doc false
  def changeset(item_warehouse_variant, attrs) do
    item_warehouse_variant
    |> cast(attrs, [])
    |> validate_required([])
  end
end
