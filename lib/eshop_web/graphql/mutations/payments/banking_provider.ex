defmodule EshopWeb.Schema.Mutations.BankingProvider do
  use Absinthe.Schema.Notation
  
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
      
    	resolve &EshopWeb.Schema.Resolvers.BankingProvider.create_user/3
    end
  end 
end
