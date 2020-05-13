defmodule EshopWeb.Schema.Queries.Warehouse do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Warehouse, as: Warehouse

  object :warehouse_queries do
      @desc "Get all warehouses"
      field :warehouses, list_of(:warehouse) do
          resolve &Warehouse.list_warehouses/3
      end

      @desc "Get a warehouse by its id"
      field :warehouse, :warehouse do
          arg :id, non_null(:id)
          resolve &Warehouse.get_warehouse/3
      end 
  end
end
