defmodule EshopWeb.Schema.Resolvers.ItemWarehouseVariant do

	def list_item_warehouse_variants(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_item_warehouse_variants()}
    end

end
