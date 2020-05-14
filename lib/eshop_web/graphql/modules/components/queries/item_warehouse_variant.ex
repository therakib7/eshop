defmodule EshopWeb.Schema.Queries.ItemWarehouseVariant do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.ItemWarehouseVariant, as: ItemWarehouseVariant

  object :item_warehouse_variant_queries do
      @desc "Get all item_warehouse_variants"
      field :item_warehouse_variants, list_of(:item_warehouse_variant) do
          resolve &ItemWarehouseVariant.list_item_warehouse_variants/3
      end

      @desc "Get a item_warehouse_variant by its id"
      field :item_warehouse_variant, :item_warehouse_variant do
          arg :id, non_null(:id)
          resolve &ItemWarehouseVariant.get_item_warehouse_variant/3
      end 
  end
end
