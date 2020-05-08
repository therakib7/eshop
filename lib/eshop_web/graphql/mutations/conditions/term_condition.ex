defmodule EshopWeb.Schema.Mutations.TermCondition do
  use Absinthe.Schema.Notation
  
  object :term_condition_mutations do
    @desc "Create a term_condition"
    field :create_term_condition, type: :term_condition do 
        arg :id, :integer
    	arg :content, :string
    	arg :native_content, :string
    	arg :type, :integer
    	arg :type_id, :integer
    	resolve &EshopWeb.Schema.Resolvers.TermCondition.create_term_condition/3
    end
  end 
end
