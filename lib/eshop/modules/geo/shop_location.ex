defmodule Eshop.Geo.ShopLocation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shop_locations" do
    belongs_to :shop, Eshop.Companies.Shop
    belongs_to :location, Eshop.Geo.Location

    timestamps()
  end

  @doc false
  def changeset(shop_location, attrs) do
    shop_location
    |> cast(attrs, [])
    |> validate_required([])
  end
end
