defmodule EshopWeb.Schema.Queries.Item do 
  use Absinthe.Schema.Notation

  object :item_queries do
    @desc "Get all items"
    field :items, list_of(:item) do
      resolve &EshopWeb.Schema.Resolvers.Item.list_items/3
    end
  end 
end
