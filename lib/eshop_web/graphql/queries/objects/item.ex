defmodule EshopWeb.Schema.Queries.Item do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Item, as: Item

  object :item_queries do
    @desc "Get all items"
    field :items, list_of(:item) do
      resolve &Item.list_items/3
    end

    @desc "Get a item by its id"
    field :item, :item do
      arg :id, non_null(:id)
      resolve &Item.get_item/3
    end 
  end
end

