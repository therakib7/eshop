defmodule EshopWeb.Schema.Resolvers.UpdateHistory do
	 
   	def list_update_histories(_parent, _args, _resolution) do
        {:ok, Eshop.Users.list_update_histories()}
    end

    def get_update_history(_, %{id: id}, _) do
		{:ok, Eshop.Users.get_update_history!(id)} 
	end 
	 
    def create_update_history(_parent, args, _resolution) do
        Eshop.Users.create_update_history(args)
    end 

    def update_update_history(%{id: id, update_history_params: update_history_params}, _info) do
		case {:ok, Eshop.Users.get_update_history!(id)} do
			{:ok, update_history} -> update_history |> Eshop.Users.update_update_history(update_history_params) 
		end  
	end

	def delete_update_history(%{id: id}, _info) do 
		case {:ok, Eshop.Users.get_update_history!(id)} do
			{:ok, update_history} -> update_history |> Eshop.Users.delete_update_history() 
		end 
	end  
end