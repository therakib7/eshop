defmodule EshopWeb.Schema.Resolvers.Variant do

    def list_variants(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_variants()}
    end

end
