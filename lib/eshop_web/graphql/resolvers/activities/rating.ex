defmodule EshopWeb.Schema.Resolvers.Rating do
	 
   	def list_ratings(_parent, _args, _resolution) do
        {:ok, Eshop.Activities.list_ratings()}
    end

    def get_rating(_, %{id: id}, _) do
		{:ok, Eshop.Activities.get_rating!(id)} 
	end 
	 
    def create_rating(_parent, args, _resolution) do
        Eshop.Activities.create_rating(args)
    end 

    def update_rating(%{id: id, rating_params: rating_params}, _info) do
		case {:ok, Eshop.Activities.get_rating!(id)} do
			{:ok, rating} -> rating |> Eshop.Activities.update_rating(rating_params) 
		end  
	end

	def delete_rating(%{id: id}, _info) do 
		case {:ok, Eshop.Activities.get_rating!(id)} do
			{:ok, rating} -> rating |> Eshop.Activities.delete_rating() 
		end 
	end  
end
