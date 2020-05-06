defmodule Eshop.Geo.ItemLocation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "item_locations" do
    field :item_id, :id
    field :location_id, :id

    timestamps()
  end

  @doc false
  def changeset(item_location, attrs) do
    item_location
    |> cast(attrs, [])
    |> validate_required([])
  end
end
