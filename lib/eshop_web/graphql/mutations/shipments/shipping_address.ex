defmodule EshopWeb.Schema.Mutations.ShippingAddress do
  use Absinthe.Schema.Notation
  
  object :shipping_address_mutations do
    @desc "Create a shipping_address"
    field :create_shipping_address, type: :shipping_address do 
      arg :id, :integer
    	arg :address, :string
    	arg :lat, :float
    	arg :long, :float
    	arg :invoice_id, :id
    	arg :location_id, :id
      
    	resolve &EshopWeb.Schema.Resolvers.ShippingAddress.create_shipping_address/2
    end
  end 
end
