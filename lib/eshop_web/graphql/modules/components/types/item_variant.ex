defmodule EshopWeb.Schema.Types.ItemVariant do
  use Absinthe.Schema.Notation

  @desc "A item_variant"
  object :item_variant do
    field :id, :integer
    field :cost_price, :decimal
    field :sale_price, :decimal
    field :unit_price, :decimal
    field :item_id, :id
    field :variant_id, :id
    field :variant_value_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A item_variant update"
  input_object :item_variant_params do
    field :cost_price, :decimal
    field :sale_price, :decimal
    field :unit_price, :decimal
    field :item_id, :id
    field :variant_id, :id
    field :variant_value_id, :id
  end
end
