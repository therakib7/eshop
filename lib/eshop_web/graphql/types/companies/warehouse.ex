defmodule EshopWeb.Schema.Types.Warehouse do
  use Absinthe.Schema.Notation
  
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
end
