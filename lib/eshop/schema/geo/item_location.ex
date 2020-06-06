defmodule Eshop.Geo.ItemLocation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "item_locations" do
    belongs_to :item, Eshop.Objects.Item
    belongs_to :location, Eshop.Geo.Location

    timestamps()
  end

  @doc false
  def changeset(item_location, attrs) do
    item_location
    |> cast(attrs, [])
    |> validate_required([])
  end
end
