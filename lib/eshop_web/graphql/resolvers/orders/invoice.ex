defmodule EshopWeb.Schema.Resolvers.Invoice do

    def list_invoices(_parent, _args, _resolution) do
        {:ok, Eshop.Orders.list_invoices()}
    end

end
