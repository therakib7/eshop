defmodule EshopWeb.Schema.Queries.Shop do 
  use Absinthe.Schema.Notation

  object :shop_queries do
    @desc "Get all shops"
    field :shops, list_of(:shop) do
      resolve &EshopWeb.Schema.Resolvers.Shop.list_shops/3
    end
  end 
end
