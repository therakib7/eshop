defmodule Eshop.Orders.InvoiceItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "invoice_items" do
    field :price, :decimal
    field :qty, :integer
    field :shipping_charge, :decimal
    field :status, :integer
    field :vat, :decimal
    field :vat_type, :integer
    belongs_to :item, Eshop.Objects.Item
    belongs_to :shop, Eshop.Orders.Invoice

    timestamps()
  end

  @doc false
  def changeset(invoice_item, attrs) do
    invoice_item
    |> cast(attrs, [:qty, :price, :vat, :vat_type, :shipping_charge, :status])
    |> validate_required([:qty, :price, :vat, :vat_type, :shipping_charge, :status])
    |> validate_inclusion(:vat_type, 1..2)
    |> validate_inclusion(:status, 1..3)
  end
end
