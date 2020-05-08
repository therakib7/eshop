defmodule EshopWeb.Schema.Mutations.DiscountCode do
  use Absinthe.Schema.Notation
  
  object :discount_code_mutations do
    @desc "Create a discount_code"
    field :create_discount_code, type: :discount_code do 
        arg :id, :integer
    	arg :amount, :integer
    	arg :code, :string
    	arg :created_at, :datetime
    	arg :is_active, :boolean
    	arg :used_at, :datetime
    	arg :validity, :integer
    	arg :shop_id, :id
    	arg :user_id, :id
    	arg :used_by, :id
    	arg :invoice_id, :id

    	resolve &EshopWeb.Schema.DiscountCode.User.create_discount_code/2
    end
  end 
end
