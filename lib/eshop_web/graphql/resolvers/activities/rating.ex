defmodule EshopWeb.Schema.Resolvers.Rating do

	def list_ratings(_parent, _args, _resolution) do
        {:ok, Eshop.Activities.list_ratings()}
    end

    def create_rating(_parent, args, _resolution) do
        Eshop.Activities.create_rating(args)
    end 

end
