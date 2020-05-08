defmodule EshopWeb.Schema.Resolvers.Rating do

	def list_roles(_parent, _args, _resolution) do
        {:ok, Eshop.Activities.list_ratings()}
    end

end
