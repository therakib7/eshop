defmodule EshopWeb.Schema.Queries.ShopShippingMethod do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.ShopShippingMethod, as: ShopShippingMethod

  object :shop_shipping_method_queries do
    @desc "Get all shop_shipping_methods"
    field :shop_shipping_methods, list_of(:shop_shipping_method) do
      resolve(&ShopShippingMethod.list_shop_shipping_methods/3)
    end

    @desc "Get a shop_shipping_method by its id"
    field :shop_shipping_method, :shop_shipping_method do
      arg(:id, non_null(:id))
      resolve(&ShopShippingMethod.get_shop_shipping_method/3)
    end
  end
end
