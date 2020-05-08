defmodule EshopWeb.Schema.Queries.ShopShippingMethod do 
  use Absinthe.Schema.Notation

  object :shop_shipping_method_queries do
    @desc "Get all shop_shipping_methods"
    field :shop_shipping_methods, list_of(:shop_shipping_method) do
      resolve &EshopWeb.Schema.Resolvers.ShopShippingMethod.list_shop_shipping_methods/3
    end
  end 
end
