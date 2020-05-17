defmodule EshopWeb.Schema.Queries.Location do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Location, as: Location

  object :location_queries do
    @desc "Get all locations"
    field :locations, list_of(:location) do
      resolve(&Location.list_locations/3)
    end

    @desc "Get a location by its id"
    field :location, :location do
      arg(:id, non_null(:id))
      resolve(&Location.get_location/3)
    end
  end
end
