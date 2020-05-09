defmodule EshopWeb.Schema.Mutations.TypeComment do
  use Absinthe.Schema.Notation

  object :type_comment_mutations do
    @desc "Create a type_comment"
    field :create_type_comment, type: :type_comment do 
      arg :comment, :string
    	arg :type, :integer
    	arg :type_id, :integer
    	arg :user_id, :id 

    	resolve &EshopWeb.Schema.Resolvers.TypeComment.create_type_comment/3
    end
  end 
end
