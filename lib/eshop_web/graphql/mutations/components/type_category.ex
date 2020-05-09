defmodule EshopWeb.Schema.Mutations.TypeCategory do
  use Absinthe.Schema.Notation
  
  object :type_category_mutations do
    @desc "Create a type_category"
    field :create_type_category, type: :type_category do 
      arg :id, :integer
    	arg :type, :integer
    	arg :type_id, :integer
    	arg :category_id, :id

    	resolve &EshopWeb.Schema.Resolvers.TypeCategory.create_user/3
    end
  end 
end
