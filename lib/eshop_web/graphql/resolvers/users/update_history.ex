defmodule EshopWeb.Schema.Resolvers.UpdateHistory do

    def list_update_histories(_parent, _args, _resolution) do
        {:ok, Eshop.Users.list_permissions()}
    end 
    
end