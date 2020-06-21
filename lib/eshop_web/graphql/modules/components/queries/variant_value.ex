defmodule EshopWeb.Schema.Queries.VariantValue do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.VariantValue

  object :variant_value_queries do
    @desc "Get all variant_values"
    field :variant_values, list_of(:variant_value) do
      resolve(&VariantValue.list_variant_values/3)
    end

    @desc "Get a variant_value by its id"
    field :variant_value, :variant_value do
      arg(:id, non_null(:id))
      resolve(&VariantValue.get_variant_value/3)
    end
  end
end
