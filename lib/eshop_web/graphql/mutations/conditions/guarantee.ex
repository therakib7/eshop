defmodule EshopWeb.Schema.Mutations.Guarantee do
  use Absinthe.Schema.Notation
  
  object :guarantee_mutations do
    @desc "Create a guarantee"
    field :create_guarantee, type: :guarantee do 
      arg :id, :integer
    	arg :content, :string
    	arg :duration, :integer
    	arg :gurantee_type, :integer
    	arg :native_content, :string
    	arg :item_id, :id

    	resolve &EshopWeb.Schema.Resolvers.Guarantee.create_guarantee/2
    end
  end 
end
