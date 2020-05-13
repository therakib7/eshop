defmodule EshopWeb.Schema.Mutations.BankingProvider do
	use Absinthe.Schema.Notation
  
	alias EshopWeb.Schema.Resolvers.BankingProvider, as: BankingProvider
  
	object :banking_provider_mutations do
	  @desc "Create a banking_provider"
	  field :create_banking_provider, type: :banking_provider do 
		  arg :id, :integer
    	arg :is_active, :boolean
    	arg :name, :string
    	arg :native_name, :string
    	arg :order, :integer
    	arg :type, :integer
    	arg :attachement_id, :id
      
		  resolve &BankingProvider.create_banking_provider/3
	  end
  
	  @desc "Update a banking_provider"
	  field :update_banking_provider, type: :banking_provider do
		  arg(:id, non_null(:id))
		  arg(:banking_provider_params, :banking_provider_params)
  
		  resolve &BankingProvider.update_banking_provider/2
	  end
	  
	  @desc "Delete a banking_provider"
	  field :delete_banking_provider, type: :banking_provider do
		  arg(:id, non_null(:id))
		  resolve &BankingProvider.delete_banking_provider/2
	  end
	end 
end