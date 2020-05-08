defmodule EshopWeb.Schema.Mutations.Rating do
  use Absinthe.Schema.Notation

  object :rating_mutations do
    @desc "Create a rating"
    field :create_rating, type: :rating do 
      arg :comment, :string
    	arg :star, :integer
    	arg :type, :integer
    	arg :type_id, :integer
    	arg :user_id, :id 
    	resolve &EshopWeb.Schema.Resolvers.Rating.create_rating/3
    end
  end
end
