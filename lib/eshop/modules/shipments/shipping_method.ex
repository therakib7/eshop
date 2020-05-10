defmodule Eshop.Shipments.ShippingMethod do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shipping_methods" do
    field :is_active, :boolean, default: false
    field :name, :string
    field :native_name, :string
    belongs_to :user, Eshop.Users.User
    belongs_to :location, Eshop.Geo.Location

    timestamps()
  end

  @doc false
  def changeset(shipping_method, attrs) do
    shipping_method
    |> cast(attrs, [:is_active, :name, :native_name, :location_id])
    |> validate_required([:name, :location_id])
    |> validate_length(:name, min: 2, max: 200)
    |> validate_length(:native_name, min: 2, max: 200)
  end
end
