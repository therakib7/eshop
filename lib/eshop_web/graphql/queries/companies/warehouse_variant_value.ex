defmodule EshopWeb.Schema.Queries.WarehouseVariantValue do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.WarehouseVariantValue, as: WarehouseVariantValue

  object :warehouse_variant_value_queries do
      @desc "Get all warehouse_variant_values"
      field :warehouse_variant_values, list_of(:warehouse_variant_value) do
          resolve &WarehouseVariantValue.list_warehouse_variant_values/3
      end

      @desc "Get a warehouse_variant_value by its id"
      field :warehouse_variant_value, :warehouse_variant_value do
          arg :id, non_null(:id)
          resolve &WarehouseVariantValue.get_warehouse_variant_value/3
      end 
  end
end
