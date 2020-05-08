defmodule EshopWeb.Schema.Resolvers.ItemVariant do

    def list_item_variants(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_item_variants()}
    end

end
