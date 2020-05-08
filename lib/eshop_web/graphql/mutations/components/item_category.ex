defmodule EshopWeb.Schema.Mutations.ItemCategory do
  use Absinthe.Schema.Notation
  
  object :item_category_mutations do
    @desc "Create a item_category"
    field :create_item_category, type: :item_category do 
        arg :id, :integer
    	arg :item_id, :id
    	arg :category_id, :id
    	resolve &EshopWeb.Schema.Resolvers.ItemCategory.create_item_category/3
    end
  end 
end
