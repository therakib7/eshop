defmodule EshopWeb.Schema.Queries.UnitType do 
  use Absinthe.Schema.Notation

  object :unit_type_queries do
    @desc "Get all unit_types"
    field :unit_types, list_of(:unit_type) do
      resolve &EshopWeb.Schema.Resolvers.Package.list_unit_types/3
    end
  end 
end
