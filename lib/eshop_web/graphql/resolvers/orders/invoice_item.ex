defmodule EshopWeb.Schema.Resolvers.InvoiceItem do

    def list_invoice_items(_parent, _args, _resolution) do
        {:ok, Eshop.Orders.list_invoice_items()}
    end

    def create_invoice_item(_parent, args, _resolution) do
        Eshop.Orders.create_invoice_item(args)
    end

end
