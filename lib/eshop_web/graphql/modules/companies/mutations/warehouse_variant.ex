defmodule EshopWeb.Schema.Mutations.WarehouseVariant do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.WarehouseVariant, as: WarehouseVariant

  object :warehouse_variant_mutations do
    @desc "Create a warehouse_variant"
    field :create_warehouse_variant, type: :warehouse_variant do
      arg(:id, :integer)
      arg(:name, :string)
      arg(:native_name, :string)
      arg(:type, :integer)
      arg(:company_id, :id)
      arg(:parent_id, :id)

      resolve(&WarehouseVariant.create_warehouse_variant/3)
    end

    @desc "Update a warehouse_variant"
    field :update_warehouse_variant, type: :warehouse_variant do
      arg(:id, non_null(:id))
      arg(:warehouse_variant_params, :warehouse_variant_params)

      resolve(&WarehouseVariant.update_warehouse_variant/2)
    end

    @desc "Delete a warehouse_variant"
    field :delete_warehouse_variant, type: :warehouse_variant do
      arg(:id, non_null(:id))
      resolve(&WarehouseVariant.delete_warehouse_variant/2)
    end
  end
end
