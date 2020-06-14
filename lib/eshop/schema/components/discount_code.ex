defmodule Eshop.Components.DiscountCode do
  use Ecto.Schema
  import Ecto.Changeset

  schema "discount_codes" do
    field :amount, :integer
    field :code, :string
    field :created_at, :utc_datetime
    field :is_active, :boolean, default: false
    field :used_at, :utc_datetime
    field :validity, :integer
    belongs_to :shop, Eshop.Companies.Shop
    belongs_to :user, Eshop.Users.User
    belongs_to :used_by, Eshop.Users.User
    belongs_to :invoice, Eshop.Orders.Invoice

    timestamps()
  end

  @doc false
  def changeset(discount_code, attrs) do
    discount_code
    |> cast(attrs, [:is_active, :code, :amount, :validity, :used_at])
    |> validate_required([:is_active, :code, :amount, :validity])
  end
end
