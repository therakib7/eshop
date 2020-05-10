defmodule Eshop.Orders.Invoice do
  use Ecto.Schema
  import Ecto.Changeset

  schema "invoices" do
    field :discount, :decimal
    field :note, :string
    field :paid, :decimal
    field :total, :decimal
    field :type, :integer
    field :company_id, :id
    field :shop_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(invoice, attrs) do
    invoice
    |> cast(attrs, [:type, :total, :discount, :note, :paid,:company_id,:shop_id])
    |> validate_required([:type, :total, :discount, :note, :paid,:company_id,:shop_id])
  end
end
