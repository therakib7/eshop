defmodule EshopWeb.Schema.Queries.ItemCategory do 
  use Absinthe.Schema.Notation

  object :item_category_queries do
    @desc "Get all item_categories"
    field :item_categories, list_of(:item_category) do
      resolve &EshopWeb.Schema.Resolvers.ItemCategory.list_item_categories/3
    end
  end 
end
