defmodule EshopWeb.Schema.Resolvers.UnitType do

	def list_unit_types(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_unit_types()}
    end

    def create_unit_type(_parent, args, _resolution) do
        Eshop.Components.create_unit_type(args)
    end

end
