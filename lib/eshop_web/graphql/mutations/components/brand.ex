defmodule EshopWeb.Schema.Mutations.Brand do
  use Absinthe.Schema.Notation
  
  object :brand_mutations do
    @desc "Create a brand"
    field :create_brand, type: :brand do 
        arg :id, :integer
    	arg :is_active, :boolean
    	arg :order, :integer
    	arg :loves, :integer
    	arg :name, :string
    	arg :native_name, :string
    	arg :slug, :string
    	arg :attachment_id, :id
    	arg :location_id, :id
    	arg :user_id, :id

    	resolve &EshopWeb.Schema.Resolvers.Brand.create_brand/3
    end
  end 
end
