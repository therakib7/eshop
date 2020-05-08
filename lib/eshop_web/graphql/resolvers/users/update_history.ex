defmodule EshopWeb.Schema.Resolvers.UpdateHistory do

    def list_update_histories(_parent, _args, _resolution) do
        {:ok, Eshop.Users.list_permissions()}
    end 
    
    def create_update_history(_parent, args, _resolution) do
        Eshop.Users.create_update_history(args)
    end

end