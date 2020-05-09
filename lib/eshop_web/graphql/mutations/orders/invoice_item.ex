defmodule EshopWeb.Schema.Mutations.InvoiceItem do
  use Absinthe.Schema.Notation
  
  object :invoice_item_mutations do
    @desc "Create a invoice_item"
    field :create_invoice_item, type: :invoice_item do 
      arg :id, :integer
    	arg :price, :decimal
    	arg :qty, :integer
    	arg :shipping_charge, :decimal
    	arg :status, :integer
    	arg :vat, :decimal
    	arg :vat_type, :integer
    	arg :item_id, :id
    	arg :invoice_id, :id
      
    	resolve &EshopWeb.Schema.Resolvers.InvoiceItem.create_user/3
    end
  end 
end
