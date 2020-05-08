defmodule EshopWeb.Schema.Resolvers.ShopPaymentMethod do

    def list_shop_payment_methods(_parent, _args, _resolution) do
        {:ok, Eshop.Payments.list_shop_payment_methods()}
    end

    def create_shop_payment_method(_parent, args, _resolution) do
        Eshop.Payments.create_shop_payment_method(args)
    end

end
