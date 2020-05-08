defmodule EshopWeb.Schema.Resolvers.Location do

	def list_locations(_parent, _args, _resolution) do
        {:ok, Eshop.Geo.list_locations()}
    end

end
