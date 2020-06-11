defmodule EshopWeb.Schema.Types.ItemWarehouseVariant do
  use Absinthe.Schema.Notation

  @desc "A item_warehouse_variant"
  object :item_warehouse_variant do
    field :id, :integer
    field :item_id, :integer
    field :warehouse_variant_id, :integer
    field :warehouse_variant_value_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A item_warehouse_variant update"
  input_object :item_warehouse_variant_params do
    field :item_id, :integer
    field :warehouse_variant_id, :integer
    field :warehouse_variant_value_id, :integer
  end
end
