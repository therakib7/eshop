defmodule EshopWeb.Schema.Resolvers.Role do

   	def list_roles(_parent, _args, _resolution) do
        {:ok, Eshop.Users.list_roles()}
    end

    def get_role(_, %{id: id}, _) do
        {:ok, Eshop.Users.get_role!(id)}
    end
    
    def create_role(_parent, args, _resolution) do
        Eshop.Users.create_role(args)
    end 

    def update_role(%{id: id, role_params: role_params}, _info) do
		case {:ok, Eshop.Users.get_role!(id)} do
			{:ok, role} -> role |> Eshop.Users.update_role(role_params)
			{:error, _} -> {:error, "Failed to update role"}
		end
	end

	def delete_role(%{id: id}, _info) do
		get_role = Eshop.Users.get_role!(id)

		with {:ok, role} <- Eshop.Users.delete_role(get_role) do
		    {:ok, role}
		  else 
		    {:error, _} -> {:error, "Failed to delete role"}
		end 
	end 
    
end