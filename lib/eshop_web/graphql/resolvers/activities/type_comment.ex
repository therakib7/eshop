defmodule EshopWeb.Schema.Resolvers.TypeComment do

	def list_type_comments(_parent, _args, _resolution) do
        {:ok, Eshop.Activities.list_type_comments()}
    end

    def create_type_comment(_parent, args, _resolution) do
        Eshop.Activities.create_type_comment(args)
    end 

end
