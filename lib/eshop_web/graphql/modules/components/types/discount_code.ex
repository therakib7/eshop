defmodule EshopWeb.Schema.Types.DiscountCode do
  use Absinthe.Schema.Notation

  @desc "A discount_code"
  object :discount_code do
    field :id, :integer
    field :amount, :integer
    field :code, :string
    field :created_at, :datetime
    field :is_active, :boolean
    field :used_at, :datetime
    field :validity, :integer
    field :shop_id, :id
    field :user_id, :id
    field :used_by, :id
    field :invoice_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A discount_code update"
  input_object :discount_code_params do 
    field :amount, :integer
    field :code, :string
    field :created_at, :datetime
    field :is_active, :boolean
    field :used_at, :datetime
    field :validity, :integer
    field :shop_id, :id
    field :user_id, :id
    field :used_by, :id
    field :invoice_id, :id
  end
end