defmodule EshopWeb.Schema.Resolvers.UserPermission do
	 
   	def list_user_permissions(_parent, _args, _resolution) do
        {:ok, Eshop.Users.list_user_permissions()}
    end

    def get_user_permission(_, %{id: id}, _) do
		{:ok, Eshop.Users.get_user_permission!(id)} 
	end 
	 
    def create_user_permission(_parent, args, _resolution) do
        Eshop.Users.create_user_permission(args)
    end 

    def update_user_permission(%{id: id, user_permission_params: user_permission_params}, _info) do
		case {:ok, Eshop.Users.get_user_permission!(id)} do
			{:ok, user_permission} -> user_permission |> Eshop.Users.update_user_permission(user_permission_params) 
		end  
	end

	def delete_user_permission(%{id: id}, _info) do 
		case {:ok, Eshop.Users.get_user_permission!(id)} do
			{:ok, user_permission} -> user_permission |> Eshop.Users.delete_user_permission() 
		end 
	end  
end