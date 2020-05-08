defmodule EshopWeb.Schema.Resolvers.ItemWarehouseVariant do

	def list_item_warehouse_variants(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_item_warehouse_variants()}
    end

    def create_warehouse_variant(_parent, args, _resolution) do
        Eshop.Components.create_warehouse_variant(args)
    end

end
