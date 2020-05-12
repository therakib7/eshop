defmodule EshopWeb.Schema.Resolvers.InvoiceStatus do

    def list_invoice_statuses(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_invoice_statuses()}
    end

    def create_invoice_status(_parent, args, _resolution) do
        Eshop.Components.create_type_status(args)
    end

end
