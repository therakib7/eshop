defmodule EshopWeb.Schema.Mutations.Role do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Role

  object :role_mutations do
    @desc "Create a role"
    field :create_role, type: :role do
      arg(:desc, :string)
      arg(:is_company, :boolean)
      arg(:name, :string)
      arg(:slug, :string)
      arg(:native_name, :string)

      resolve(&Role.create_role/3)
    end

    @desc "Update a role"
    field :update_role, type: :role do
      arg(:id, non_null(:id))
      arg(:role_params, :role_params)

      resolve(&Role.update_role/2)
    end

    @desc "Delete a role"
    field :delete_role, type: :role do
      arg(:id, non_null(:id))
      resolve(&Role.delete_role/2)
    end
  end
end
