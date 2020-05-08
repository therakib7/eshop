defmodule EshopWeb.Schema.Resolvers.Permission do

    def list_permissions(_parent, _args, _resolution) do
        {:ok, Eshop.Users.list_permissions()}
    end 

    def create_permission(_parent, args, _resolution) do
        Eshop.Users.create_permission(args)
    end
    
end