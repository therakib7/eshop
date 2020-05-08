defmodule EshopWeb.Schema.Queries.Product do 
  use Absinthe.Schema.Notation

  object :product_queries do
    @desc "Get all products"
    field :products, list_of(:product) do
      resolve &EshopWeb.Schema.Resolvers.Product.list_products/3
    end
  end 
end
