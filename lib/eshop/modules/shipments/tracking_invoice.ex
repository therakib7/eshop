defmodule Eshop.Shipments.TrackingInvoice do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tracking_invoices" do
    field :tracking_id, :string
    belongs_to :invoice, Eshop.Orders.Invoice
    belongs_to :shipping_method, Eshop.Shipments.ShippingMethod
    timestamps()
  end

  @doc false
  def changeset(tracking_invoice, attrs) do
    tracking_invoice
    |> cast(attrs, [:tracking_id, :invoice_id, :shipping_method_id])
    |> validate_required([:invoice_id, :shipping_method_id])
    |> validate_length(:tracking_id, min: 8, max: 80)
  end
end
