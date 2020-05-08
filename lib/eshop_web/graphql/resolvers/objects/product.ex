defmodule EshopWeb.Schema.Resolvers.Product do

    def list_products(_parent, _args, _resolution) do
        {:ok, Eshop.Objects.list_products()}
    end

    def create_product(_parent, args, _resolution) do
        Eshop.Objects.create_product(args)
    end

end
