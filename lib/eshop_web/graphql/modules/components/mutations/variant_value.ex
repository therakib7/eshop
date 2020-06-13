defmodule EshopWeb.Schema.Mutations.VariantValue do
  use Absinthe.Schema.Notation
  alias EshopWeb.Graphql.Middleware.Auth
  alias EshopWeb.Schema.Resolvers.VariantValue, as: VariantValue

  object :variant_value_mutations do
    @desc "Create a variant_value"
    field :create_variant_value, type: :variant_value do
      middleware(Auth, %{per: "component_update", context: "components", model: "variant"})
      arg(:native_value, non_null(:string))
      arg(:value, non_null(:string))
      arg(:variant_id, non_null(:integer))

      resolve(&VariantValue.create_variant_value/3)
    end

    @desc "Update a variant_value"
    field :update_variant_value, type: :variant_value do
      middleware(Auth, %{per: "component_update", context: "components", model: "variant"})
      arg(:id, non_null(:id))
      arg(:variant_value_params, :variant_value_params)

      resolve(&VariantValue.update_variant_value/2)
    end

    @desc "Delete a variant_value"
    field :delete_variant_value, type: :variant_value do
      middleware(Auth, %{per: "component_update", context: "components", model: "variant"})
      arg(:id, non_null(:id))
      resolve(&VariantValue.delete_variant_value/2)
    end
  end
end
