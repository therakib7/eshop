defmodule EshopWeb.Schema.Queries.ShippingMethod do 
  use Absinthe.Schema.Notation

  object :shipping_method_queries do
    @desc "Get all shipping_methods"
    field :shipping_methods, list_of(:shipping_method) do
      resolve &EshopWeb.Schema.Resolvers.ShippingMethod.list_shipping_methods/3
    end
  end 
end
