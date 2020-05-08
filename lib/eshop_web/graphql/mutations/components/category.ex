defmodule EshopWeb.Schema.Mutations.Category do
  use Absinthe.Schema.Notation
  
  object :category_mutations do
    @desc "Create a category"
    field :create_category, type: :category do 
      arg :id, :integer
    	arg :is_active, :boolean
    	arg :order, :integer
    	arg :name, :string
    	arg :native_name, :string
    	arg :slug, :string
    	arg :parent_id, :id
    	arg :attachment_id, :id
    	arg :user_id, :id
    	resolve &EshopWeb.Schema.Resolvers.Category.create_category/3
    end
  end 
end
