defmodule EshopWeb.Schema.Resolvers.Shop do

    def list_shops(_parent, _args, _resolution) do
        {:ok, Eshop.Companies.list_shops()}
    end

    def create_shop(_parent, args, _resolution) do
        Eshop.Companies.create_shop(args)
    end

end
