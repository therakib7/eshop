defmodule EshopWeb.Schema.Queries.ItemWarehouseVariant do 
  use Absinthe.Schema.Notation

  object :item_warehouse_variant_queries do
    @desc "Get all item_warehouse_variants"
    field :item_warehouse_variants, list_of(:item_warehouse_variant) do
      resolve &EshopWeb.Schema.Resolvers.ItemWarehouseVariant.list_item_warehouse_variants/3
    end
  end 
end
