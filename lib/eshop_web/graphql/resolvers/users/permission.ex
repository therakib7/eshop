defmodule EshopWeb.Schema.Resolvers.Permission do
	 
   	def list_permissions(_parent, _args, _resolution) do
        {:ok, Eshop.Users.list_permissions()}
    end

    def get_permission(_, %{id: id}, _) do
		{:ok, Eshop.Users.get_permission!(id)} 
	end 
	 
    def create_permission(_parent, args, _resolution) do
        Eshop.Users.create_permission(args)
    end 

    def update_permission(%{id: id, permission_params: permission_params}, _info) do
		case {:ok, Eshop.Users.get_permission!(id)} do
			{:ok, permission} -> permission |> Eshop.Users.update_permission(permission_params) 
		end  
	end

	def delete_permission(%{id: id}, _info) do 
		case {:ok, Eshop.Users.get_permission!(id)} do
			{:ok, permission} -> permission |> Eshop.Users.delete_permission() 
		end 
	end  
end