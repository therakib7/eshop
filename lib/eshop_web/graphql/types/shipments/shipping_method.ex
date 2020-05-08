defmodule EshopWeb.Schema.Types.ShippingMethod do
  use Absinthe.Schema.Notation
  
  object :shipping_method do
    field :id, :integer
    field :is_active, :boolean
    field :name, :string
    field :native_name, :string
    field :user_id, :id
    field :location_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
