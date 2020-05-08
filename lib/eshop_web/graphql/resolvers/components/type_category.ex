defmodule EshopWeb.Schema.Resolvers.TypeCategory do

	def list_type_categories(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_type_categories()}
    end

end
