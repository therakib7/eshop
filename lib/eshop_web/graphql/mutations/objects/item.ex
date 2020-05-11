defmodule EshopWeb.Schema.Mutations.Item do
  use Absinthe.Schema.Notation
  
  object :item_mutations do
    @desc "Create a item"
    field :create_item, type: :item do 
        arg :id, :integer
    	arg :asin_id, :string
    	arg :cost_price, :decimal
    	arg :desc, :string
    	arg :extra_args, :string
    	arg :has_package, :boolean
    	arg :has_variant, :boolean
    	arg :has_warehouse, :boolean
		arg :is_online, :boolean
    	arg :is_active, :boolean
    	arg :loves, :integer
    	arg :low_stock, :integer
    	arg :name, :string
    	arg :native_desc, :string
    	arg :native_name, :string
    	arg :sell_price, :decimal
    	arg :total_order, :integer
    	arg :type, :integer
    	arg :type_id, :integer
    	arg :unit, :integer
    	arg :unit_price, :decimal
    	arg :vat, :integer
    	arg :vat_type, :integer
    	arg :views, :integer
    	arg :user_id, :id
    	arg :shop_id, :id
    	arg :unit_type_id, :id

    	resolve &EshopWeb.Schema.Resolvers.Item.create_item/3
    end
  end 
end
