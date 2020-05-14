defmodule EshopWeb.Schema.Queries.Product do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Product, as: Product

  object :product_queries do
    @desc "Get all products"
    field :products, list_of(:product) do
      resolve &Product.list_products/3
    end

    @desc "Get a product by its id"
    field :product, :product do
      arg :id, non_null(:id)
      resolve &Product.get_product/3
    end 
  end
end

