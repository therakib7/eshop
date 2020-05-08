defmodule EshopWeb.Schema.Resolvers.Category do

    def list_categories(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_categories()}
    end

    def create_category(_parent, args, _resolution) do
        Eshop.Components.create_category(args)
    end

end
