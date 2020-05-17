defmodule EshopWeb.Schema.Resolvers.User do
	 
   	def list_users(_parent, _args, %{context: %{current_user: _current_user}}) do
        {:ok, Eshop.Users.list_users()}
    end

	def list_users(_parent, _args, _resolution) do
	 {:error, "Not Authorized"}
	end 

    def get_user(_, %{id: id}, %{context: %{current_user: _current_user}}) do
		{:ok, Eshop.Users.get_user!(id)} 
	end 

	def get_user(_, %{id: id}, _) do
	 {:error, "Not Authorized"}
	end 
	 
    def create_user(_parent, args, _resolution) do
        Eshop.Users.create_user(args)
    end 

    def update_user(%{id: id, user_params: user_params}, _info) do
		case {:ok, Eshop.Users.get_user!(id)} do
			{:ok, user} -> user |> Eshop.Users.update_user(user_params) 
		end  
	end

	def delete_user(%{id: id}, _info) do 
		case {:ok, Eshop.Users.get_user!(id)} do
			{:ok, user} -> user |> Eshop.Users.delete_user() 
		end 
	end  
end