defmodule EshopWeb.Schema.Resolvers.InvoiceItemVariant do

	def list_invoice_item_variants(_parent, _args, _resolution) do
        {:ok, Eshop.Orders.list_invoice_item_variants()}
    end

end
