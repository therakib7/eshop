defmodule EshopWeb.Schema.Mutations.Invoice do
  use Absinthe.Schema.Notation
  
  object :invoice_mutations do
    @desc "Create a invoice"
    field :create_invoice, type: :invoice do 
      arg :id, :integer
    	arg :discount, :decimal
    	arg :user_note, :string
    	arg :shop_note, :string
    	arg :paid, :decimal
    	arg :total, :decimal
    	arg :type, :integer
    	arg :company_id, :id
    	arg :shop_id, :id
    	arg :user_id, :id
      
    	resolve &EshopWeb.Schema.Resolvers.Invoice.create_user/3
    end
  end 
end
