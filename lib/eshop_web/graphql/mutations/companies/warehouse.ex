defmodule EshopWeb.Schema.Mutations.Warehouse do
  use Absinthe.Schema.Notation
  
  object :warehouse_mutations do
    @desc "Create a warehouse"
    field :create_warehouse, type: :warehouse do 
      arg :id, :integer
    	arg :is_active, :boolean
    	arg :name, :string
    	arg :native_name, :string
    	arg :shop_id, :id
    	arg :user_id, :id
    	arg :location_id, :id
    	resolve &EshopWeb.Schema.Resolvers.Warehouse.create_warehouse/3
    end
  end 
end
