defmodule EshopWeb.Schema.Resolvers.TypeUserRole do

	def list_type_user_roles(_parent, _args, _resolution) do
        {:ok, Eshop.Companies.list_type_user_roles()}
    end

    def create_type_user_role(_parent, args, _resolution) do
        Eshop.Companies.create_type_user_role(args)
    end

end
