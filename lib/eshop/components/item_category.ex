defmodule Eshop.Components.ItemCategory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "item_categories" do
    field :item_id, :id
    field :category_id, :id

    timestamps()
  end

  @doc false
  def changeset(item_category, attrs) do
    item_category
    |> cast(attrs, [])
    |> validate_required([])
  end
end
