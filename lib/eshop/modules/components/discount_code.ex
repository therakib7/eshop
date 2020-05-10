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
    field :shop_id, :id
    field :user_id, :id
    field :used_by, :id
    field :invoice_id, :id

    timestamps()
  end

  @doc false
  def changeset(discount_code, attrs) do
    discount_code
    |> cast(attrs, [:is_active, :code, :amount, :validity, :created_at, :used_at])
    |> validate_required([:is_active, :code, :amount, :validity, :created_at, :used_at])
  end
end
