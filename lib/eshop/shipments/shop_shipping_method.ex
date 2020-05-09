defmodule Eshop.Shipments.ShopShippingMethod do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shop_shipping_methods" do
    field :shipping_method_id, :id
    field :shop_id, :id

    timestamps()
  end

  @doc false
  def changeset(shop_shipping_method, attrs) do
    shop_shipping_method
    |> cast(attrs, [:shipping_method_id, :shop_id])
    |> validate_required([:shipping_method_id, :shop_id])
    
  end
end
