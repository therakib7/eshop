defmodule EshopWeb.Schema.Resolvers.User do

    def list_permissions(_parent, _args, _resolution) do
        {:ok, Eshop.Users.list_permissions()}
    end 
    
end