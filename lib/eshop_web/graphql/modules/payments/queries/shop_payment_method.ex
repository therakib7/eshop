defmodule EshopWeb.Schema.Queries.ShopPaymentMethod do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.ShopPaymentMethod, as: ShopPaymentMethod

  object :shop_payment_method_queries do
    @desc "Get all shop_payment_methods"
    field :shop_payment_methods, list_of(:shop_payment_method) do
      resolve(&ShopPaymentMethod.list_shop_payment_methods/3)
    end

    @desc "Get a shop_payment_method by its id"
    field :shop_payment_method, :shop_payment_method do
      arg(:id, non_null(:id))
      resolve(&ShopPaymentMethod.get_shop_payment_method/3)
    end
  end
end
