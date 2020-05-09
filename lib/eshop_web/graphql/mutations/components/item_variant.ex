defmodule EshopWeb.Schema.Mutations.ItemVariant do
  use Absinthe.Schema.Notation
  
  object :item_variant_mutations do
    @desc "Create a item_varian"
    field :create_item_varian, type: :item_varian do 
      arg :id, :integer
    	arg :cost_price, :decimal
    	arg :sale_price, :decimal
    	arg :unit_price, :decimal
    	arg :item_id, :id
    	arg :variant_id, :id
    	arg :variant_value_id, :id

    	resolve &EshopWeb.Schema.Resolvers.ItemVariant.create_item_varian/3
    end
  end 
end
