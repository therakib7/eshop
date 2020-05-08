defmodule EshopWeb.Schema.Mutations.TrackingInvoice do
  use Absinthe.Schema.Notation
  
  object :tracking_invoice_mutations do
    @desc "Create a tracking_invoice"
    field :create_tracking_invoice, type: :tracking_invoice do 
      arg :id, :integer
    	arg :tracking_id, :string
    	arg :invoice_id, :id
    	arg :shipping_method_id, :id
    	
    	resolve &EshopWeb.Schema.Resolvers.TrackingInvoice.create_tracking_invoice/2
    end
  end 
end
