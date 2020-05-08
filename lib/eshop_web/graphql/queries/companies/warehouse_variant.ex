defmodule EshopWeb.Schema.Queries.WarehouseVariant do 
  use Absinthe.Schema.Notation

  object :warehouse_variant_queries do
    field :id, :integer
    field :name, :string
    field :native_name, :string
    field :type, :integer
    field :company_id, :id
    field :parent_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
