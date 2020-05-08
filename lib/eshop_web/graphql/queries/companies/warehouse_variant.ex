defmodule EshopWeb.Schema.Queries.WarehouseVariant do 
  use Absinthe.Schema.Notation

  object :warehouse_variant_queries do
    @desc "Get all warehouse_variants"
    field :warehouse_variants, list_of(:warehouse_variant) do
      resolve &EshopWeb.Schema.Resolvers.WarehouseVariant.list_warehouse_variants/3
    end
  end 
end
