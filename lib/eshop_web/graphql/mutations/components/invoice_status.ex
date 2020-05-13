defmodule EshopWeb.Schema.Mutations.InvoiceStatus do
	use Absinthe.Schema.Notation
  
	alias EshopWeb.Schema.Resolvers.InvoiceStatus, as: InvoiceStatus
  
	object :invoice_status_mutations do
	  @desc "Create a invoice_status"
	  field :create_invoice_status, type: :invoice_status do 
		  arg :id, :integer
      arg :invoice_id, :integer
      arg :type, :integer
      arg :type_id, :integer
      arg :status_id, :integer
      
		  resolve &InvoiceStatus.create_invoice_status/3
	  end
  
	  @desc "Update a invoice_status"
	  field :update_invoice_status, type: :invoice_status do
		  arg(:id, non_null(:id))
		  arg(:invoice_status_params, :invoice_status_params)
  
		  resolve &InvoiceStatus.update_invoice_status/2
	  end
	  
	  @desc "Delete a invoice_status"
	  field :delete_invoice_status, type: :invoice_status do
		  arg(:id, non_null(:id))
		  resolve &InvoiceStatus.delete_invoice_status/2
	  end
	end 
end