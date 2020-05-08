defmodule EshopWeb.Schema.Resolvers.ShippingAddress do

    def list_shipping_addresses(_parent, _args, _resolution) do
        {:ok, Eshop.Shipments.list_shipping_addresses()}
    end

    def create_shipping_address(_parent, args, _resolution) do
        Eshop.Shipments.create_shipping_address(args)
    end

end
