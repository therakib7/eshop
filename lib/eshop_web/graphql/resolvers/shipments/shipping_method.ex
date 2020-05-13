defmodule EshopWeb.Schema.Resolvers.ShippingMethod do
	 
   	def list_shipping_methods(_parent, _args, _resolution) do
        {:ok, Eshop.Shipments.list_shipping_methods()}
    end

    def get_shipping_method(_, %{id: id}, _) do
		{:ok, Eshop.Shipments.get_shipping_method!(id)} 
	end 
	 
    def create_shipping_method(_parent, args, _resolution) do
        Eshop.Shipments.create_shipping_method(args)
    end 

    def update_shipping_method(%{id: id, shipping_method_params: shipping_method_params}, _info) do
		case {:ok, Eshop.Shipments.get_shipping_method!(id)} do
			{:ok, shipping_method} -> shipping_method |> Eshop.Shipments.update_shipping_method(shipping_method_params) 
		end  
	end

	def delete_shipping_method(%{id: id}, _info) do 
		case {:ok, Eshop.Shipments.get_shipping_method!(id)} do
			{:ok, shipping_method} -> shipping_method |> Eshop.Shipments.delete_shipping_method() 
		end 
	end  
end