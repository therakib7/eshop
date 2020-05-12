defmodule EshopWeb.Schema.Mutations.InvoiceStatus do
  use Absinthe.Schema.Notation
  
  object :invoice_statust_mutations do
    @desc "Create a invoice_status"
    field :create_invoice_status, type: :invoice_status do   
      arg :id, :integer
      arg :invoice_id, :integer
      arg :type, :integer
      arg :type_id, :integer
      arg :status_id, :integer 
  
    	resolve &EshopWeb.Schema.Resolvers.InvoiceStatus.create_invoice_status/3
    end
  end 
end
