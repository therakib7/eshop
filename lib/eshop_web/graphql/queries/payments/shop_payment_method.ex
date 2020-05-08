defmodule EshopWeb.Schema.Queries.ShopPaymentMethod do 
  use Absinthe.Schema.Notation

  object :shop_payment_method_queries do
    @desc "Get all shop_payment_methods"
    field :shop_payment_methods, list_of(:shop_payment_method) do
      resolve &EshopWeb.Schema.Resolvers.ShopPaymentMethod.list_shop_payment_methods/3
    end
  end
end
