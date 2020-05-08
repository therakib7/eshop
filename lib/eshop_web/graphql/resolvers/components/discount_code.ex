defmodule EshopWeb.Schema.Resolvers.DiscountCode do

    def list_discount_codes(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_discount_codes()}
    end

    def create_discount_code(_parent, args, _resolution) do
        Eshop.Components.create_discount_code(args)
    end

end
