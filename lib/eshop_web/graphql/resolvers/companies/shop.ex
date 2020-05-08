defmodule EshopWeb.Schema.Resolvers.Shop do

    def list_shops(_parent, _args, _resolution) do
        {:ok, Eshop.Companies.list_shops()}
    end

end
