defmodule EshopWeb.Schema.Mutations.Faq do
  use Absinthe.Schema.Notation
  
  object :faq_mutations do
    @desc "Create a faq"
    field :create_faq, type: :faq do 
      arg :id, :integer
    	arg :content, :string
    	arg :native_content, :string
    	arg :native_question, :string
    	arg :question, :string
    	arg :item_id, :id
    	arg :user_id, :id

    	resolve &EshopWeb.Schema.Resolvers.Faq.create_faq/3
    end
  end 
end
