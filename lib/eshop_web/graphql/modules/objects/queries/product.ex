defmodule EshopWeb.Schema.Queries.Product do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern

  alias EshopWeb.Schema.Resolvers.Product

  input_object :product_filter do
    field :id, :integer
    field :name, :string
    field :categories, list_of(:integer)
    field :brands, list_of(:integer)
    field :shops, list_of(:integer)
    field :inserted_before, :naive_datetime
    field :inserted_after, :naive_datetime
  end

  connection(node_type: :item_type)

  object :product_queries do 

    @desc "Get all products"
    connection field :products, node_type: :item_type do
      arg(:filter, :product_filter)
      resolve(&Product.list_products/3)
    end

    @desc "Get a product by its id"
    field :product, :item_type do
      arg(:id, non_null(:id))
      resolve(&Product.get_product/3)
    end
  end
end
