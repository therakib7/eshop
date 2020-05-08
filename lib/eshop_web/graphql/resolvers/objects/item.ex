defmodule EshopWeb.Schema.Resolvers.Item do

    def list_items(_parent, _args, _resolution) do
        {:ok, Eshop.Objects.list_items()}
    end

    def create_item(_parent, args, _resolution) do
        Eshop.Objects.create_item(args)
    end

end
