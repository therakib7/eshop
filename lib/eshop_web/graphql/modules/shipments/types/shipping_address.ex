defmodule EshopWeb.Schema.Types.ShippingAddress do
  use Absinthe.Schema.Notation

  @desc "A shipping_address"
  object :shipping_address do
    field :id, :integer
    field :address, :string
    field :lat, :float
    field :long, :float
    field :invoice_id, :integer
    field :location_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A shipping_address update"
  input_object :shipping_address_params do
    field :address, :string
    field :lat, :float
    field :long, :float
    field :invoice_id, :integer
    field :location_id, :integer
  end
end
