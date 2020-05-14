defmodule EshopWeb.Schema.Queries.UserPermission do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.UserPermission, as: UserPermission

  object :user_permission_queries do
    @desc "Get all user_permissions"
    field :user_permissions, list_of(:user_permission) do
      resolve &UserPermission.list_user_permissions/3
    end

    @desc "Get a user_permission by its id"
    field :user_permission, :user_permission do
      arg :id, non_null(:id)
      resolve &UserPermission.get_user_permission/3
    end 
  end
end