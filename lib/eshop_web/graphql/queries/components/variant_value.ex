defmodule EshopWeb.Schema.Queries.VariantValue do 
  use Absinthe.Schema.Notation

  object :variant_value_queries do
    @desc "Get all variant_values"
    field :variant_values, list_of(:variant_value) do
      resolve &EshopWeb.Schema.Resolvers.VariantValue.list_variant_values/3
    end
  end 
end
