defmodule Eshop.Geo.ShopLocation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shop_locations" do
    field :shop_id, :id
    field :location_id, :id

    timestamps()
  end

  @doc false
  def changeset(shop_location, attrs) do
    shop_location
    |> cast(attrs, [])
    |> validate_required([])
  end
end
