defmodule EshopWeb.Schema.Types.ShippingAddress do
  use Absinthe.Schema.Notation
  
  object "shipping_addresse" do
    field :id, :integer
    field :address, :string
    field :lat, :float
    field :long, :float
    field :invoice_id, :id
    field :location_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
