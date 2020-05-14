defmodule EshopWeb.Schema.Queries.UnitType do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.UnitType, as: UnitType

  object :unit_type_queries do
      @desc "Get all unit_types"
      field :unit_types, list_of(:unit_type) do
          resolve &UnitType.list_unit_types/3
      end

      @desc "Get a unit_type by its id"
      field :unit_type, :unit_type do
          arg :id, non_null(:id)
          resolve &UnitType.get_unit_type/3
      end 
  end
end
