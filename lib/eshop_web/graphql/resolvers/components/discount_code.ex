defmodule EshopWeb.Schema.Resolvers.DiscountCode do

    def list_discount_codes(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_discount_codes()}
    end

end
