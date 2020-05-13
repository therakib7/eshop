defmodule EshopWeb.Schema.Resolvers.InvoiceStatus do
	 
   	def list_invoice_statuses(_parent, _args, _resolution) do
        {:ok, Eshop.Components.list_invoice_statuses()}
    end

    def get_invoice_status(_, %{id: id}, _) do
		{:ok, Eshop.Components.get_invoice_status!(id)} 
	end 
	 
    def create_invoice_status(_parent, args, _resolution) do
        Eshop.Components.create_invoice_status(args)
    end 

    def update_invoice_status(%{id: id, invoice_status_params: invoice_status_params}, _info) do
		case {:ok, Eshop.Components.get_invoice_status!(id)} do
			{:ok, invoice_status} -> invoice_status |> Eshop.Components.update_invoice_status(invoice_status_params) 
		end  
	end

	def delete_invoice_status(%{id: id}, _info) do 
		case {:ok, Eshop.Components.get_invoice_status!(id)} do
			{:ok, invoice_status} -> invoice_status |> Eshop.Components.delete_invoice_status() 
		end 
	end  
end
