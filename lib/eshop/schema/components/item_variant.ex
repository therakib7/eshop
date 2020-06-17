defmodule Eshop.Components.ItemVariant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "item_variants" do
    field :cost_price, :decimal
    field :sale_price, :decimal
    field :unit_price, :decimal
    belongs_to :item, Eshop.Objects.Item
    belongs_to :variant, Eshop.Components.Variant
    belongs_to :variant_value, Eshop.Components.VariantValue
    timestamps()
  end

  @doc false
  def changeset(item_variant, attrs) do
    item_variant
    |> cast(attrs, [:item_id, :variant_id, :variant_value_id, :unit_price, :cost_price, :sale_price])
    |> validate_required([:variant_id, :variant_value_id, :unit_price, :cost_price, :sale_price])
  end
end
