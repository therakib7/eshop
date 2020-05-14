defmodule EshopWeb.Schema.Queries.Role do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Role, as: Role

  object :role_queries do
    @desc "Get all roles"
    field :roles, list_of(:role) do
      resolve &Role.list_roles/3
    end

    @desc "Get a role by its id"
    field :role, :role do
      arg :id, non_null(:id)
      resolve &Role.get_role/3
    end 
  end
end