defmodule EshopWeb.Schema.Resolvers.LoginDetail do

    def list_login_details(_parent, _args, _resolution) do
        {:ok, Eshop.Users.list_login_details()}
    end

    def create_login_detail(_parent, args, _resolution) do
        Eshop.Users.create_login_detail(args)
    end
    
end