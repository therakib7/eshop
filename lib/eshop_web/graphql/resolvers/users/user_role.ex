defmodule EshopWeb.Schema.Resolvers.UserRole do

    def list_user_roles(_parent, _args, _resolution) do
        {:ok, Eshop.Users.list_user_roles()}
    end

    def create_user_role(_parent, args, _resolution) do
        Eshop.Users.create_user_role(args)
    end
    
end