defmodule EshopWeb.Schema.Queries.ItemVariant do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.ItemVariant, as: ItemVariant

  object :item_variant_queries do
      @desc "Get all item_variants"
      field :item_variants, list_of(:item_variant) do
          resolve &ItemVariant.list_item_variants/3
      end

      @desc "Get a item_variant by its id"
      field :item_variant, :item_variant do
          arg :id, non_null(:id)
          resolve &ItemVariant.get_item_variant/3
      end 
  end
end
