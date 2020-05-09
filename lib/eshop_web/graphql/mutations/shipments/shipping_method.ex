defmodule EshopWeb.Schema.Mutations.ShippingMethod do
  use Absinthe.Schema.Notation
  
  object :shipping_method_mutations do
    @desc "Create a shipping_method"
    field :create_shipping_method, type: :shipping_method do 
      arg :id, :integer
    	arg :is_active, :boolean
    	arg :name, :string
    	arg :native_name, :string
    	arg :user_id, :id
    	arg :location_id, :id
      
    	resolve &EshopWeb.Schema.Resolvers.ShippingMethod.create_shipping_method/2
    end
  end 
end
