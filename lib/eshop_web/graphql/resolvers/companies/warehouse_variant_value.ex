defmodule EshopWeb.Schema.Resolvers.WarehouseVariantValue do

	def list_warehouse_variant_values(_parent, _args, _resolution) do
        {:ok, Eshop.Companies.list_warehouse_variant_values()}
    end

end
