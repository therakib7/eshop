defmodule EshopWeb.Schema.Queries.Variant do
  use Absinthe.Schema.Notation
  alias EshopWeb.Graphql.Middleware.Auth
  alias EshopWeb.Schema.Resolvers.Variant, as: Variant

  object :variant_queries do
    @desc "Get all variants"
    field :variants, list_of(:variant) do
      resolve(&Variant.list_variants/3)
    end

    @desc "Get a variant by its id"
    field :variant, :variant do
      arg(:id, non_null(:id))
      resolve(&Variant.get_variant/3)
    end
  end
end
