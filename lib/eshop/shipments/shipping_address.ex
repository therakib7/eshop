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
    |> cast(attrs, [:lat, :long, :address])
    |> validate_required([:lat, :long, :address])
  end
end
