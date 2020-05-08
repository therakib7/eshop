defmodule EshopWeb.Schema.Queries.ItemVariant do 
  use Absinthe.Schema.Notation

  object :item_variant_queries do
    @desc "Get all item_variants"
    field :item_variants, list_of(:item_variant) do
      resolve &EshopWeb.Schema.Resolvers.ItemVariant.list_item_variants/3
    end
  end 
end
