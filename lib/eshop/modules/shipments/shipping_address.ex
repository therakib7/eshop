defmodule Eshop.Shipments.ShippingAddress do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shipping_addresses" do
    field :address, :string
    field :lat, :float
    field :long, :float
    field :invoice_id, :id
    field :location_id, :id

    timestamps()
  end

  @doc false
  def changeset(shipping_address, attrs) do
    shipping_address
    |> cast(attrs, [:lat, :long, :address, :invoice_id, :location_id])
    |> validate_required([:lat, :long, :address, :invoice_id, :location_id])
    |> validate_length(:address, min: 2, max: 300)
    |> validate_number(:lat, greater_than_or_equal_to: -90, less_than_or_equal_to: 90)
    |> validate_number(:long, greater_than_or_equal_to: -180, less_than_or_equal_to: 180)
  end
end
