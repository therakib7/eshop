defmodule Eshop.Shipments.TrackingInvoice do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tracking_invoices" do
    field :tracking_id, :string
    field :invoice_id, :id
    field :shipping_method_id, :id

    timestamps()
  end

  @doc false
  def changeset(tracking_invoice, attrs) do
    tracking_invoice
    |> cast(attrs, [:tracking_id])
    |> validate_required([:tracking_id])
  end
end
