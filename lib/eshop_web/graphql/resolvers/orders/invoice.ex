defmodule EshopWeb.Schema.Resolvers.Invoice do

    def list_invoices(_parent, _args, _resolution) do
        {:ok, Eshop.Orders.list_invoices()}
    end

    def create_invoice(_parent, args, _resolution) do
        Eshop.Orders.create_invoice(args)
    end

end
