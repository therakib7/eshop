defmodule EshopWeb.Schema.Queries.Permission do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Permission, as: Permission

  object :permission_queries do
    @desc "Get all permissions"
    field :permissions, list_of(:permission) do
      resolve(&Permission.list_permissions/3)
    end

    @desc "Get a permission by its id"
    field :permission, :permission do
      arg(:id, non_null(:id))
      resolve(&Permission.get_permission/3)
    end
  end
end
