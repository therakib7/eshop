defmodule EshopWeb.Schema.Resolvers.InvoiceItem do
	 
   	def list_invoice_items(_parent, _args, _resolution) do
        {:ok, Eshop.Orders.list_invoice_items()}
    end

    def get_invoice_item(_, %{id: id}, _) do
		{:ok, Eshop.Orders.get_invoice_item!(id)} 
	end 
	 
    def create_invoice_item(_parent, args, _resolution) do
        Eshop.Orders.create_invoice_item(args)
    end 

    def update_invoice_item(%{id: id, invoice_item_params: invoice_item_params}, _info) do
		case {:ok, Eshop.Orders.get_invoice_item!(id)} do
			{:ok, invoice_item} -> invoice_item |> Eshop.Orders.update_invoice_item(invoice_item_params) 
		end  
	end

	def delete_invoice_item(%{id: id}, _info) do 
		case {:ok, Eshop.Orders.get_invoice_item!(id)} do
			{:ok, invoice_item} -> invoice_item |> Eshop.Orders.delete_invoice_item() 
		end 
	end  
end