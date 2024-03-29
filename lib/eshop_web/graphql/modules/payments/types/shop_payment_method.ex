defmodule EshopWeb.Schema.Types.ShopPaymentMethod do
  use Absinthe.Schema.Notation

  @desc "A shop_payment_method"
  object :shop_payment_method do
    field :id, :integer
    field :ac_holder_name, :string
    field :ac_no, :integer
    field :account_type, :string
    field :is_active, :boolean
    field :shop_id, :integer
    field :banking_provider_id, :integer
    field :user_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A shop_payment_method update"
  input_object :shop_payment_method_params do
    field :ac_holder_name, :string
    field :ac_no, :integer
    field :account_type, :string
    field :is_active, :boolean
    field :shop_id, :integer
    field :banking_provider_id, :integer
    field :user_id, :integer
  end
end
