defmodule EshopWeb.Schema.Resolvers.Warehouse do

    def list_warehouses(_parent, _args, _resolution) do
        {:ok, Eshop.Companies.list_warehouses()}
    end

    def create_warahouse(_parent, args, _resolution) do
        Eshop.Companies.create_warahouse(args)
    end

end
