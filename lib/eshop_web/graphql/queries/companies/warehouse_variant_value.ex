defmodule EshopWeb.Schema.Queries.WarehouseVariantValue do 
  use Absinthe.Schema.Notation

  object :warehouse_variant_value_queries do
    @desc "Get all warehouse_variant_values"
    field :warehouse_variant_values, list_of(:warehouse_variant_value) do
      resolve &EshopWeb.Schema.Resolvers.WarehouseVariantValue.list_warehouse_variant_values/3
    end
  end 
end
