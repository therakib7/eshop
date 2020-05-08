defmodule EshopWeb.Schema.Resolvers.Warehouse do

    def list_type_user_roles(_parent, _args, _resolution) do
        {:ok, Eshop.Companies.list_type_user_roles()}
    end
        
end
