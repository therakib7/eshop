defmodule Eshop.Payments.ShopPaymentMethod do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shop_payment_methods" do
    field :ac_holder_name, :string
    field :ac_no, :integer
    field :account_type, :string
    field :is_active, :boolean, default: false
    field :shop_id, :id
    field :banking_provider_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(shop_payment_method, attrs) do
    shop_payment_method
    |> cast(attrs, [:is_active, :ac_holder_name, :ac_no, :account_type])
    |> validate_required([:is_active, :ac_holder_name, :ac_no, :account_type])
  end
end
