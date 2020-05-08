defmodule EshopWeb.Schema.Queries.TypeUserRole do 
  use Absinthe.Schema.Notation

  object :type_user_role_queries do
    @desc "Get all type_user_roles"
    field :type_user_roles, list_of(:type_user_role) do
      resolve &EshopWeb.Schema.Resolvers.TypeUserRole.list_type_user_roles/3
    end
  end 
end
