defmodule EshopWeb.Schema.Resolvers.ShippingAddress do

    def list_shipping_addresses(_parent, _args, _resolution) do
        {:ok, Eshop.Shipments.list_shipping_addresses()}
    end

end
