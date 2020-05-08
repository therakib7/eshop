defmodule EshopWeb.Schema.Mutations.WarehouseVariant do
  use Absinthe.Schema.Notation
  
  object :warehouse_variant_mutations do
    @desc "Create a warehouse_variant"
    field :create_warehouse_variant, type: :warehouse_variant do 
      arg :id, :integer
    	arg :name, :string
    	arg :native_name, :string
    	arg :type, :integer
    	arg :company_id, :id
    	arg :parent_id, :id

    	resolve &EshopWeb.Schema.Resolvers.WarehouseVariant.create_warehouse_variant/2
    end
  end 
end
