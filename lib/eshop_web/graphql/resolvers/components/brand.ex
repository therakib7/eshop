defmodule EshopWeb.Schema.Resolvers.Brand do

    def list_brands(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_brands()}
    end

end
