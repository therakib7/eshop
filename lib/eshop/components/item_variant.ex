defmodule Eshop.Components.ItemVariant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "item_variants" do
    field :cost_price, :decimal
    field :sale_price, :decimal
    field :unit_price, :decimal
    field :item_id, :id
    field :variant_id, :id
    field :variant_value_id, :id

    timestamps()
  end

  @doc false
  def changeset(item_variant, attrs) do
    item_variant
    |> cast(attrs, [:unit_price, :cost_price, :sale_price])
    |> validate_required([:unit_price, :cost_price, :sale_price])
  end
end
