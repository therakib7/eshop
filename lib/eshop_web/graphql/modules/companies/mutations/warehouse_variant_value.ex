defmodule EshopWeb.Schema.Mutations.WarehouseVariantValue do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.WarehouseVariantValue, as: WarehouseVariantValue

  object :warehouse_variant_value_mutations do
    @desc "Create a warehouse_variant_value"
    field :create_warehouse_variant_value, type: :warehouse_variant_value do 
      arg :id, :integer
    	arg :native_value, :string
    	arg :value, :string
    	arg :warehouse_variant_id, :id

      resolve &WarehouseVariantValue.create_warehouse_variant_value/3
    end

    @desc "Update a warehouse_variant_value"
    field :update_warehouse_variant_value, type: :warehouse_variant_value do
        arg(:id, non_null(:id))
        arg(:warehouse_variant_value_params, :warehouse_variant_value_params)

        resolve &WarehouseVariantValue.update_warehouse_variant_value/2
    end
    
    @desc "Delete a warehouse_variant_value"
    field :delete_warehouse_variant_value, type: :warehouse_variant_value do
        arg(:id, non_null(:id))
        resolve &WarehouseVariantValue.delete_warehouse_variant_value/2
    end
  end 
end