defmodule EshopWeb.Schema.Resolvers.CountryStage do

    def list_country_stages(_parent, _args, _resolution) do
        {:ok, Eshop.Geo.list_country_stages()}
    end

    def create_country_stage(_parent, args, _resolution) do
        Eshop.Geo.create_country_stage(args)
    end

end