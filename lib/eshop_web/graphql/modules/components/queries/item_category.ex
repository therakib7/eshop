defmodule EshopWeb.Schema.Queries.ItemCategory do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.ItemCategory, as: ItemCategory

  object :item_category_queries do
    @desc "Get all item_categories"
    field :item_categories, list_of(:item_category) do
      resolve(&ItemCategory.list_item_categories/3)
    end

    @desc "Get a item_category by its id"
    field :item_category, :item_category do
      arg(:id, non_null(:id))
      resolve(&ItemCategory.get_item_category/3)
    end
  end
end
