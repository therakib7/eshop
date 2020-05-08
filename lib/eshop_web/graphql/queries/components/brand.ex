defmodule EshopWeb.Schema.Queries.Brand do 
  use Absinthe.Schema.Notation

  object :brand_queries do
    @desc "Get all brands"
    field :brands, list_of(:brand) do
      resolve &EshopWeb.Schema.Resolvers.Brand.list_brands/3
    end
  end 
end
