defmodule EshopWeb.Schema.Types.WarehouseVariant do
  use Absinthe.Schema.Notation

  @desc "A warehouse_variant"
  object :warehouse_variant do
    field :id, :integer
    field :name, :string
    field :native_name, :string
    field :type, :integer
    field :company_id, :id
    field :parent_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A warehouse_variant update"
  input_object :warehouse_variant_params do 
    field :name, :string
    field :native_name, :string
    field :type, :integer
    field :company_id, :id
    field :parent_id, :id
  end
end