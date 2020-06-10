defmodule Eshop.Components.ItemCategory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "item_categories" do
    belongs_to :item, Eshop.Objects.Item
    belongs_to :category, Eshop.Components.Category

    timestamps()
  end

  @doc false
  def changeset(item_category, attrs) do
    item_category
    |> cast(attrs, [:item_id, :category_id])
    |> validate_required([:item_id, :category_id])
  end
end
