defmodule Eshop.Components.InvoiceStatus do
  use Ecto.Schema
  import Ecto.Changeset

  schema "invoice_statuses" do
    field :type, :integer
    field :type_id, :integer
    belongs_to :invoice, Eshop.Orders.Invoice
    belongs_to :type_status, Eshop.Components.TypeStatus

    timestamps()
  end 

  @doc false
  def changeset(invoice_status, attrs) do
    invoice_status
    |> cast(attrs, [:type, :type_id])
    |> validate_required([:type, :type_id])
  end
end
