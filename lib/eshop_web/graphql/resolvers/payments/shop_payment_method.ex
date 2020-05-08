defmodule EshopWeb.Schema.Resolvers.ShopPaymentMethod do

    def list_shop_payment_methods(_parent, _args, _resolution) do
        {:ok, Eshop.Payments.list_shop_payment_methods()}
    end

end
