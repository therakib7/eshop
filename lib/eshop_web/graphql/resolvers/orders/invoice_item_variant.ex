defmodule EshopWeb.Schema.Resolvers.InvoiceItemVariant do

	def list_invoice_item_variants(_parent, _args, _resolution) do
        {:ok, Eshop.Orders.list_invoice_item_variants()}
    end

    def create_invoice_item_variant(_parent, args, _resolution) do
        Eshop.Orders.create_invoice_item_variant(args)
    end

end
