defmodule Eshop.Payments.ShopPaymentMethod do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shop_payment_methods" do
    field :ac_holder_name, :string
    field :ac_no, :integer
    field :account_type, :string
    field :is_active, :boolean, default: false
    field :banking_provider_id, :id
    belongs_to :user, Eshop.Users.User
    belongs_to :shop, Eshop.Companies.Shop

    timestamps()
  end

  @doc false
  def changeset(shop_payment_method, attrs) do
    shop_payment_method
    |> cast(attrs, [
      :is_active,
      :ac_holder_name,
      :ac_no,
      :account_type,
      :shop_id,
      :banking_provider_id
    ])
    |> validate_required([:ac_holder_name, :ac_no, :account_type, :shop_id, :banking_provider_id])
    |> validate_length(:ac_holder_name, min: 20, max: 100)
    |> validate_length(:account_type, min: 20, max: 200)
  end
end
