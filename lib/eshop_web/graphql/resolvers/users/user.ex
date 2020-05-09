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
end