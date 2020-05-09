defmodule EshopWeb.Schema.Mutations.UserLove do
  use Absinthe.Schema.Notation

  object :user_love_mutations do
    @desc "Create a user_love"
    field :create_user_love, type: :user_love do  
    	arg :type, :integer
    	arg :type_id, :integer
    	arg :user_id, :id 

    	resolve &EshopWeb.Schema.Resolvers.UserLove.create_user_love/2
    end
  end 
end
