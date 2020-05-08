defmodule EshopWeb.Schema.Mutations.WarehouseVariantValue do
  use Absinthe.Schema.Notation
  
  object :warehouse_variant_value_mutations do
    @desc "Create a warehouse_variant_value"
    field :create_warehouse_variant_value, type: :warehouse_variant_value do 
        arg :id, :integer
    	arg :native_value, :string
    	arg :value, :string
    	arg :warehouse_variant_id, :id
    	resolve &EshopWeb.Schema.Resolvers.WarehouseVariantValue.create_warehouse_variant/3
    end
  end
end
