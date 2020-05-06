defmodule Eshop.Orders.InvoiceItemVariant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "invoice_item_variants" do
    field :invoice_item_id, :id
    field :variant_id, :id
    field :variant_value_id, :id

    timestamps()
  end

  @doc false
  def changeset(invoice_item_variant, attrs) do
    invoice_item_variant
    |> cast(attrs, [])
    |> validate_required([])
  end
end
