defmodule EshopWeb.Schema.Types.Warehouse do
  use Absinthe.Schema.Notation

  @desc "A warehouse"
  object :warehouse do
    field :id, :integer
    field :is_active, :boolean
    field :name, :string
    field :native_name, :string
    field :shop_id, :id
    field :user_id, :id
    field :location_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A warehouse update"
  input_object :warehouse_params do 
    field :is_active, :boolean
    field :name, :string
    field :native_name, :string
    field :shop_id, :id
    field :user_id, :id
    field :location_id, :id
  end
end