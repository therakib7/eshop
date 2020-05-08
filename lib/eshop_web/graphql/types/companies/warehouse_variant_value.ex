defmodule EshopWeb.Schema.Types.WarehouseVariantValue do
  use Absinthe.Schema.Notation
  
  object :warehouse_variant_value do
    field :id, :integer
    field :native_value, :string
    field :value, :string
    field :warehouse_variant_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end
end
