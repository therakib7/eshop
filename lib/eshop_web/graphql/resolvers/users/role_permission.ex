defmodule EshopWeb.Schema.Resolvers.RolePermission do
	 
   	def list_role_permissions(_parent, _args, _resolution) do
        {:ok, Eshop.Users.list_role_permissions()}
    end

    def get_role_permission(_, %{id: id}, _) do
		{:ok, Eshop.Users.get_role_permission!(id)} 
	end 
	 
    def create_role_permission(_parent, args, _resolution) do
        Eshop.Users.create_role_permission(args)
    end 

    def update_role_permission(%{id: id, role_permission_params: role_permission_params}, _info) do
		case {:ok, Eshop.Users.get_role_permission!(id)} do
			{:ok, role_permission} -> role_permission |> Eshop.Users.update_role_permission(role_permission_params) 
		end  
	end

	def delete_role_permission(%{id: id}, _info) do 
		case {:ok, Eshop.Users.get_role_permission!(id)} do
			{:ok, role_permission} -> role_permission |> Eshop.Users.delete_role_permission() 
		end 
	end  
end