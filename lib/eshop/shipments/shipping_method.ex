defmodule Eshop.Shipments.ShippingMethod do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shipping_methods" do
    field :is_active, :boolean, default: false
    field :name, :string
    field :native_name, :string
    field :user_id, :id
    field :location_id, :id

    timestamps()
  end

  @doc false
  def changeset(shipping_method, attrs) do
    shipping_method
    |> cast(attrs, [:is_active, :name, :native_name])
    |> validate_required([:is_active, :name, :native_name])
  end
end
