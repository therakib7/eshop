defmodule EshopWeb.Schema.Resolvers.CountryStage do

    def list_country_stages(_parent, _args, _resolution) do
        {:ok, Eshop.Geo.list_country_stages()}
    end

end