defmodule EshopWeb.Schema.Resolvers.User do

    def list_users(_parent, _args, _resolution) do
        {:ok, Eshop.Users.list_users()}
    end

    def get_user(_, %{id: id}, _) do
        {:ok, Eshop.Users.get_user!(id)}
    end
    
    def create_user(_parent, args, _resolution) do
        Eshop.Users.create_user(args)
    end 

    def update_user(%{id: id, user: user_params}, _info) do
		# case get(%{id: id}, _info) do
		# 	{:ok, user} -> user |> Eshop.Users.update_user(user_params)
		# 	{:error, _} -> {:error, "Failed to update user"}
		# end
	end

	def delete_user(%{id: id}, _info) do
		{:ok, Eshop.Users.delete_user(id)}
		# with {:ok, user} <- Eshop.Users.delete_user(id) do
		# 	{:ok, user}
		# 	else 
		# 	{:error, _} -> {:error, "Failed to delete user"}
		# end
	end
end