defmodule EshopWeb.Schema.Resolvers.Product do

    def list_products(_parent, _args, _resolution) do
        {:ok, Eshop.Objects.list_products()}
    end

end
