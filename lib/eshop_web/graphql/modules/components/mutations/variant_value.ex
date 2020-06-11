defmodule EshopWeb.Schema.Mutations.VariantValue do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.VariantValue, as: VariantValue

  object :variant_value_mutations do
    @desc "Create a variant_value"
    field :create_variant_value, type: :variant_value do
      arg(:id, :integer)
      arg(:native_value, :string)
      arg(:value, :string)
      arg(:variant_id, :integer)

      resolve(&VariantValue.create_variant_value/3)
    end

    @desc "Update a variant_value"
    field :update_variant_value, type: :variant_value do
      arg(:id, non_null(:id))
      arg(:variant_value_params, :variant_value_params)

      resolve(&VariantValue.update_variant_value/2)
    end

    @desc "Delete a variant_value"
    field :delete_variant_value, type: :variant_value do
      arg(:id, non_null(:id))
      resolve(&VariantValue.delete_variant_value/2)
    end
  end
end
