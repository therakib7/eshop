defmodule EshopWeb.Schema.Mutations.Shop do
  use Absinthe.Schema.Notation
  
  object :shop_mutations do
    @desc "Create a shop"
    field :create_shop, type: :shop do 
        arg :id, :integer
    	arg :created_at, :datetime
    	arg :golden_supplier, :boolean
    	arg :highest_assurance, :decimal
    	arg :is_active, :boolean
    	arg :is_verifed, :boolean
    	arg :name, :string
    	arg :native_name, :string
    	arg :trade_assurance, :boolean
    	arg :company_id, :id
    	arg :user_id, :id
    	arg :location_id, :id
    	arg :attachment_id, :id
    	arg :term_condition_id, :id
        
    	resolve &EshopWeb.Schema.Resolvers.Shop.create_shop/3
    end
  end 
end
