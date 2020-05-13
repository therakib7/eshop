defmodule EshopWeb.Schema.Queries.RolePermission do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.RolePermission, as: RolePermission

  object :role_permission_queries do
    @desc "Get all role_permissions"
    field :role_permissions, list_of(:role_permission) do
      resolve &RolePermission.list_role_permissions/3
    end

    @desc "Get a role_permission by its id"
    field :role_permission, :role_permission do
      arg :id, non_null(:id)
      resolve &RolePermission.get_role_permission/3
    end 
  end
end