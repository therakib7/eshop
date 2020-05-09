defmodule EshopWeb.Schema.Mutations.ShopShippingMethod do
  use Absinthe.Schema.Notation
  
  object :shop_shipping_method_mutations do
    @desc "Create a shop_shipping_method"
    field :create_shop_shipping_method, type: :shop_shipping_method do 
      arg :id, :integer
    	arg :shipping_method_id, :id
    	arg :shop_id, :id
    	
    	resolve &EshopWeb.Schema.Resolvers.ShopShippingMethod.create_shop_shipping_method/3
    end
  end 
end
