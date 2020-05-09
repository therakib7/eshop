defmodule EshopWeb.Schema.Mutations.ShopPaymentMethod do
  use Absinthe.Schema.Notation
  
  object :shop_payment_method_mutations do
    @desc "Create a shop_payment_method"
    field :create_shop_payment_method, type: :shop_payment_method do 
      arg :id, :integer
    	arg :ac_holder_name, :string
    	arg :ac_no, :integer
    	arg :account_type, :string
    	arg :is_active, :boolean
    	arg :shop_id, :id
    	arg :banking_provider_id, :id
    	arg :user_id, :id
      
    	resolve &EshopWeb.Schema.Resolvers.ShopPaymentMethod.create_shop_payment_method/3
    end
  end
end
