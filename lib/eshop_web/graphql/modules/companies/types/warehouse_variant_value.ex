defmodule EshopWeb.Schema.Types.WarehouseVariantValue do
  use Absinthe.Schema.Notation

  @desc "A warehouse_variant_value"
  object :warehouse_variant_value do
    field :id, :integer
    field :native_value, :string
    field :value, :string
    field :warehouse_variant_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A warehouse_variant_value update"
  input_object :warehouse_variant_value_params do
    field :native_value, :string
    field :value, :string
    field :warehouse_variant_id, :integer
  end
end
