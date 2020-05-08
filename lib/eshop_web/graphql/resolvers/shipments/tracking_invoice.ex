defmodule EshopWeb.Schema.Resolvers.TrackingInvoice do

	def list_tracking_invoices(_parent, _args, _resolution) do
        {:ok, Eshop.Shipments.list_tracking_invoices()}
    end

    def create_tracking_invoice(_parent, args, _resolution) do
        Eshop.Shipments.create_tracking_invoice(args)
    end

end
