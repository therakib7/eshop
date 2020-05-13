defmodule EshopWeb.Schema.Queries.CountryStage do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.CountryStage, as: CountryStage

  object :country_stage_queries do
      @desc "Get all country_stages"
      field :country_stages, list_of(:country_stage) do
          resolve &CountryStage.list_country_stages/3
      end

      @desc "Get a country_stage by its id"
      field :country_stage, :country_stage do
          arg :id, non_null(:id)
          resolve &CountryStage.get_country_stage/3
      end 
  end
end
