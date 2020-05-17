defmodule EshopWeb.Schema.Mutations.Warehouse do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Warehouse, as: Warehouse

  object :warehouse_mutations do
    @desc "Create a warehouse"
    field :create_warehouse, type: :warehouse do
      arg(:id, :integer)
      arg(:is_active, :boolean)
      arg(:name, :string)
      arg(:native_name, :string)
      arg(:shop_id, :id)
      arg(:user_id, :id)
      arg(:location_id, :id)

      resolve(&Warehouse.create_warehouse/3)
    end

    @desc "Update a warehouse"
    field :update_warehouse, type: :warehouse do
      arg(:id, non_null(:id))
      arg(:warehouse_params, :warehouse_params)

      resolve(&Warehouse.update_warehouse/2)
    end

    @desc "Delete a warehouse"
    field :delete_warehouse, type: :warehouse do
      arg(:id, non_null(:id))
      resolve(&Warehouse.delete_warehouse/2)
    end
  end
end
