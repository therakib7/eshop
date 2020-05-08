defmodule EshopWeb.Schema.Queries.CountryStage do
    use Absinthe.Schema.Notation

    object :country_stage do
        @desc "Get all country_stages"
        field :country_stages, list_of(:country_stage) do
          resolve &EshopWeb.Schema.Resolvers.CountryStage.list_country_stages/3
        end
    end
end