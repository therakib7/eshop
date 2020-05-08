defmodule EshopWeb.Schema.Resolvers.Item do

    def list_items(_parent, _args, _resolution) do
        {:ok, Eshop.Objects.list_items()}
    end

end
