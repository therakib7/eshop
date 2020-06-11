defmodule EshopWeb.Schema.Mutations.TypeStatus do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.TypeStatus, as: TypeStatus

  object :type_status_mutations do
    @desc "Create a type_status"
    field :create_type_status, type: :type_status do
      arg(:id, :integer)
      arg(:is_active, :boolean)
      arg(:order, :integer)
      arg(:type, :integer)
      arg(:name, :string)
      arg(:native_name, :string)
      arg(:user_id, :integer)

      resolve(&TypeStatus.create_type_status/3)
    end

    @desc "Update a type_status"
    field :update_type_status, type: :type_status do
      arg(:id, non_null(:id))
      arg(:type_status_params, :type_status_params)

      resolve(&TypeStatus.update_type_status/2)
    end

    @desc "Delete a type_status"
    field :delete_type_status, type: :type_status do
      arg(:id, non_null(:id))
      resolve(&TypeStatus.delete_type_status/2)
    end
  end
end
