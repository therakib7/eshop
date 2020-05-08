defmodule EshopWeb.Schema.Resolvers.ShippingMethod do

    def list_shipping_methods(_parent, _args, _resolution) do
        {:ok, Eshop.Shipments.list_shipping_methods()}
    end

    def create_shipping_method(_parent, args, _resolution) do
        Eshop.Shipments.create_shipping_method(args)
    end

end
