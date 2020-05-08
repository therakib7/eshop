defmodule EshopWeb.Schema.Resolvers.TrackingInvoice do

	def list_tracking_invoices(_parent, _args, _resolution) do
        {:ok, Eshop.Shipments.list_tracking_invoices()}
    end

end
