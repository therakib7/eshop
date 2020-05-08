defmodule EshopWeb.Schema.Queries.Variant do 
  use Absinthe.Schema.Notation

  object :variant_queries do
    @desc "Get all variants"
    field :variants, list_of(:variant) do
      resolve &EshopWeb.Schema.Resolvers.Variant.list_variants/3
    end
  end 
end
