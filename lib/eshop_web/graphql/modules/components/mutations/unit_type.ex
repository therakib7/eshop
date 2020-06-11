defmodule EshopWeb.Schema.Mutations.UnitType do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.UnitType

  object :unit_type_mutations do
    @desc "Create a unit_type"
    field :create_unit_type, type: :unit_type do
      arg(:id, :integer)
      arg(:name, :string)
      arg(:native_name, :string)
      arg(:user_id, :integer)

      resolve(&UnitType.create_unit_type/3)
    end

    @desc "Update a unit_type"
    field :update_unit_type, type: :unit_type do
      arg(:id, non_null(:id))
      arg(:unit_type_params, :unit_type_params)

      resolve(&UnitType.update_unit_type/2)
    end

    @desc "Delete a unit_type"
    field :delete_unit_type, type: :unit_type do
      arg(:id, non_null(:id))
      resolve(&UnitType.delete_unit_type/2)
    end
  end
end
