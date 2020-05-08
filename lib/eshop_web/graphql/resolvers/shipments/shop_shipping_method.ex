defmodule EshopWeb.Schema.Resolvers.ShopShippingMethod do

	def list_shop_shipping_methods(_parent, _args, _resolution) do
        {:ok, Eshop.Shipments.list_shop_shipping_methods()}
    end

    def create_shop_shipping_method(_parent, args, _resolution) do
        Eshop.Shipments.create_shop_shipping_method(args)
    end

end
