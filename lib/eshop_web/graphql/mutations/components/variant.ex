defmodule EshopWeb.Schema.Mutations.Variant do
  use Absinthe.Schema.Notation
  
  object :variant_mutations do
    @desc "Create a variant"
    field :create_variant, type: :variant do 
      arg :id, :integer
    	arg :order, :integer
    	arg :name, :string
    	arg :native_name, :string
    	arg :type, :integer
    	arg :shop_id, :id
    	arg :user_id, :id

    	resolve &EshopWeb.Schema.Resolvers.Variant.create_variant/2
    end
  end 
end
