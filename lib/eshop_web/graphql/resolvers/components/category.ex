defmodule EshopWeb.Schema.Resolvers.Category do

    def list_categories(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_categories()}
    end

end
