defmodule EshopWeb.Schema.Resolvers.ItemCategory do

	def list_item_categories(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_item_categories()}
    end

    def create_item_category(_parent, args, _resolution) do
        Eshop.Components.create_item_category(args)
    end

end
