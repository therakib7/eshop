defmodule EshopWeb.Schema.Queries.WarehouseVariant do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.WarehouseVariant, as: WarehouseVariant

  object :warehouse_variant_queries do
      @desc "Get all warehouse_variants"
      field :warehouse_variants, list_of(:warehouse_variant) do
          resolve &WarehouseVariant.list_warehouse_variants/3
      end

      @desc "Get a warehouse_variant by its id"
      field :warehouse_variant, :warehouse_variant do
          arg :id, non_null(:id)
          resolve &WarehouseVariant.get_warehouse_variant/3
      end 
  end
end
