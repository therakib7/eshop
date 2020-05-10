defmodule Eshop.Orders.Invoice do
  use Ecto.Schema
  import Ecto.Changeset

  schema "invoices" do
    field :discount, :decimal
    field :user_note, :string
    field :shop_note, :string
    field :paid, :decimal
    field :total, :decimal
    field :type, :integer
    belongs_to :company, Eshop.Companies.Company
    belongs_to :shop, Eshop.Companies.Shop
    belongs_to :user, Eshop.Users.User

    timestamps()
  end

  @doc false
  def changeset(invoice, attrs) do
    invoice
    |> cast(attrs, [:type, :total, :discount, :user_note, :shop_note, :paid])
    |> validate_required([:type, :total, :discount, :note, :paid, :company_id, :shop_id])
    |> validate_length(:user_note, min: 2, max: 500)
    |> validate_length(:shop_note, min: 2, max: 500)

  end
end
