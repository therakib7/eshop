defmodule EshopWeb.Schema.Resolvers.InvoiceItem do

    def list_invoice_items(_parent, _args, _resolution) do
        {:ok, Eshop.Orders.list_invoice_items()}
    end

end
