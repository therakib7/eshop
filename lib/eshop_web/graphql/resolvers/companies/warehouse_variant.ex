defmodule EshopWeb.Schema.Resolvers.WarehouseVariant do

    def list_warehouse_variants(_parent, _args, _resolution) do
        {:ok, Eshop.Companies.list_warehouse_variants()}
    end

end
