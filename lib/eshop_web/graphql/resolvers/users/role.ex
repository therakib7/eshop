defmodule EshopWeb.Schema.Resolvers.Role do

    def list_roles(_parent, _args, _resolution) do
        {:ok, Eshop.Users.list_roles()}
    end
    
end