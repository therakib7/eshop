defmodule Eshop.Orders.InvoiceItemVariant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "invoice_item_variants" do
    belongs_to :invoice_item, Eshop.Orders.Invoice
    belongs_to :variant, Eshop.Components.Variant
    belongs_to :variant_value, Eshop.Components.VariantValue

    timestamps()
  end

  @doc false
  def changeset(invoice_item_variant, attrs) do
    invoice_item_variant
    |> cast(attrs, [])
    |> validate_required([])
  end
end
