defmodule EshopWeb.Schema.Mutations.InvoiceItemVariant do
  use Absinthe.Schema.Notation
  
  object :invoice_item_variant_mutations do
    @desc "Create a invoice_item_variant"
    field :create_invoice_item_variant, type: :invoice_item_variant do 
      arg :id, :integer
    	arg :invoice_item_id, :id
    	arg :variant_id, :id
    	arg :variant_value_id, :id

    	resolve &EshopWeb.Schema.Resolvers.InvoiceItemVariant.create_user/2
    end
  end 
end
