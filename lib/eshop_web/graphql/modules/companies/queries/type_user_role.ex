defmodule EshopWeb.Schema.Queries.TypeUserRole do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.TypeUserRole, as: TypeUserRole

  object :type_user_role_queries do
      @desc "Get all type_user_roles"
      field :type_user_roles, list_of(:type_user_role) do
          resolve &TypeUserRole.list_type_user_roles/3
      end

      @desc "Get a type_user_role by its id"
      field :type_user_role, :type_user_role do
          arg :id, non_null(:id)
          resolve &TypeUserRole.get_type_user_role/3
      end 
  end
end
