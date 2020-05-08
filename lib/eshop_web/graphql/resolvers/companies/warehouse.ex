defmodule EshopWeb.Schema.Resolvers.Warehouse do

    def list_warehouses(_parent, _args, _resolution) do
        {:ok, Eshop.Companies.list_warehouses()}
    end

end
