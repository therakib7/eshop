defmodule EshopWeb.Schema.Mutations.UserPermission do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.UserPermission, as: UserPermission

  object :user_permission_mutations do
    @desc "Create a user_permission"
    field :create_user_permission, type: :user_permission do
      arg(:id, :integer)
      arg(:user_id, :id)
      arg(:permission_id, :id)

      resolve(&UserPermission.create_user_permission/3)
    end

    @desc "Update a user_permission"
    field :update_user_permission, type: :user_permission do
      arg(:id, non_null(:id))
      arg(:user_permission_params, :user_permission_params)

      resolve(&UserPermission.update_user_permission/2)
    end

    @desc "Delete a user_permission"
    field :delete_user_permission, type: :user_permission do
      arg(:id, non_null(:id))
      resolve(&UserPermission.delete_user_permission/2)
    end
  end
end
