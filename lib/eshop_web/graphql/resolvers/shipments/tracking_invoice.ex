defmodule EshopWeb.Schema.Resolvers.TrackingInvoice do
	 
   	def list_tracking_invoices(_parent, _args, _resolution) do
        {:ok, Eshop.Shipments.list_tracking_invoices()}
    end

    def get_tracking_invoice(_, %{id: id}, _) do
		{:ok, Eshop.Shipments.get_tracking_invoice!(id)} 
	end 
	 
    def create_tracking_invoice(_parent, args, _resolution) do
        Eshop.Shipments.create_tracking_invoice(args)
    end 

    def update_tracking_invoice(%{id: id, tracking_invoice_params: tracking_invoice_params}, _info) do
		case {:ok, Eshop.Shipments.get_tracking_invoice!(id)} do
			{:ok, tracking_invoice} -> tracking_invoice |> Eshop.Shipments.update_tracking_invoice(tracking_invoice_params) 
		end  
	end

	def delete_tracking_invoice(%{id: id}, _info) do 
		case {:ok, Eshop.Shipments.get_tracking_invoice!(id)} do
			{:ok, tracking_invoice} -> tracking_invoice |> Eshop.Shipments.delete_tracking_invoice() 
		end 
	end  
end