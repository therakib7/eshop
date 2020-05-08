defmodule EshopWeb.Schema.Resolvers.Location do

	def list_locations(_parent, _args, _resolution) do
        {:ok, Eshop.Geo.list_locations()}
    end

    def create_location(_parent, args, _resolution) do
        Eshop.Geo.create_location(args)
    end

end
