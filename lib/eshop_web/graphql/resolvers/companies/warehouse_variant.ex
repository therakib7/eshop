defmodule EshopWeb.Schema.Resolvers.WarehouseVariant do

    def list_warehouse_variants(_parent, _args, _resolution) do
        {:ok, Eshop.Companies.list_warehouse_variants()}
    end

    def create_warehouse_variant(_parent, args, _resolution) do
        Eshop.Companies.create_warehouse_variant(args)
    end

end
