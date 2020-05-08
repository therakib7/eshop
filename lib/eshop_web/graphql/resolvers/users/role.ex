defmodule EshopWeb.Schema.Resolvers.Role do

    def list_roles(_parent, _args, _resolution) do
        {:ok, Eshop.Users.list_roles()}
    end

    def create_role(_parent, args, _resolution) do
        Eshop.Users.create_role(args)
    end
    
end