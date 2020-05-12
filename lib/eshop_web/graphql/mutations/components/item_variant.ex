defmodule EshopWeb.Schema.Mutations.ItemVariant do
  use Absinthe.Schema.Notation
  
  object :item_variant_mutations do
    @desc "Create a item_variant"
    field :create_item_variant, type: :item_variant do 
      arg :id, :integer
    	arg :cost_price, :decimal
    	arg :sale_price, :decimal
    	arg :unit_price, :decimal
    	arg :item_id, :id
    	arg :variant_id, :id
    	arg :variant_value_id, :id

    	resolve &EshopWeb.Schema.Resolvers.ItemVariant.create_item_variant/3
    end
  end 
end
