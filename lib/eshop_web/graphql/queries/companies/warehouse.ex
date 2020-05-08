defmodule EshopWeb.Schema.Queries.Warehouse do 
  use Absinthe.Schema.Notation

  object :warehouse_queries do
    @desc "Get all warehouses"
    field :warehouses, list_of(:warehouse) do
      resolve &EshopWeb.Schema.Resolvers.Shop.list_warehouses/3
    end
  end 
end
