defmodule EshopWeb.Schema.Resolvers.User do

    def list_users(_parent, _args, _resolution) do
        {:ok, Eshop.Users.list_users()}
    end
    
    def create_user(_parent, args, _resolution) do
        Eshop.Users.create_user(args)
    end 
end