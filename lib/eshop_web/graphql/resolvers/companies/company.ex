defmodule EshopWeb.Schema.Resolvers.Company do

    def list_companies(_parent, _args, _resolution) do
        {:ok, Eshop.Companies.list_companies()}
    end

end
