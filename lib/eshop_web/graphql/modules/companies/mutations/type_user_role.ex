defmodule EshopWeb.Schema.Mutations.TypeUserRole do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.TypeUserRole, as: TypeUserRole

  object :type_user_role_mutations do
    @desc "Create a type_user_role"
    field :create_type_user_role, type: :type_user_role do
      arg(:id, :integer)
      arg(:type, :integer)
      arg(:type_id, :integer)
      arg(:user_id, :integer)
      arg(:role_id, :integer)

      resolve(&TypeUserRole.create_type_user_role/3)
    end

    @desc "Update a type_user_role"
    field :update_type_user_role, type: :type_user_role do
      arg(:id, non_null(:id))
      arg(:type_user_role_params, :type_user_role_params)

      resolve(&TypeUserRole.update_type_user_role/2)
    end

    @desc "Delete a type_user_role"
    field :delete_type_user_role, type: :type_user_role do
      arg(:id, non_null(:id))
      resolve(&TypeUserRole.delete_type_user_role/2)
    end
  end
end
