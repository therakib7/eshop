defmodule EshopWeb.Schema.Resolvers.TypeComment do

	def list_type_comments(_parent, _args, _resolution) do
        {:ok, Eshop.Activities.list_type_comments()}
    end

end
