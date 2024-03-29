defmodule EshopWeb.Schema.Types.Invoice do
  use Absinthe.Schema.Notation

  @desc "A invoice"
  object :invoice do
    field :id, :integer
    field :discount, :decimal
    field :user_note, :string
    field :shop_note, :string
    field :paid, :decimal
    field :total, :decimal
    field :type, :integer
    field :company_id, :integer
    field :shop_id, :integer
    field :user_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A invoice update"
  input_object :invoice_params do
    field :discount, :decimal
    field :user_note, :string
    field :shop_note, :string
    field :paid, :decimal
    field :total, :decimal
    field :type, :integer
    field :company_id, :integer
    field :shop_id, :integer
    field :user_id, :integer
  end
end
