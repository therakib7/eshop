defmodule EshopWeb.Schema.Queries.UserRole do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.UserRole, as: UserRole

  object :user_role_queries do
    @desc "Get all user_roles"
    field :user_roles, list_of(:user_role) do
      resolve &UserRole.list_user_roles/3
    end

    @desc "Get a user_role by its id"
    field :user_role, :user_role do
      arg :id, non_null(:id)
      resolve &UserRole.get_user_role/3
    end 
  end
end