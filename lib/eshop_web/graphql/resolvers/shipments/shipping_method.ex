defmodule EshopWeb.Schema.Resolvers.ShippingMethod do

    def list_shipping_methods(_parent, _args, _resolution) do
        {:ok, Eshop.Shipments.list_shipping_methods()}
    end

end
