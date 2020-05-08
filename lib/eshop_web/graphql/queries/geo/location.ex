defmodule EshopWeb.Schema.Queries.Location do
  use Absinthe.Schema.Notation

	object :location do
		@desc "Get all locations"
        field :locations, list_of(:location) do
          resolve &EshopWeb.Schema.Resolvers.Location.list_locations/3
        end
	end
end
