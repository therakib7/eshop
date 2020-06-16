defmodule EshopWeb.Schema.Types.DiscountCode do
  use Absinthe.Schema.Notation

  @desc "A discount_code"
  object :discount_code do
    field :id, :integer
    field :name, :string
    field :amount, :integer
    field :code, :string
    field :created_at, :datetime
    field :is_active, :boolean
    field :used_at, :datetime
    field :validity, :integer
    field :shop_id, :integer
    field :user_id, :integer
    field :used_by_id, :id
    field :invoice_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A discount_code update"
  input_object :discount_code_params do
    field :name, :string
    field :amount, :integer
    field :code, :string
    field :created_at, :datetime
    field :is_active, :boolean
    field :used_at, :datetime
    field :validity, :integer
    field :shop_id, :integer
    field :user_id, :integer 
    field :invoice_id, :integer
  end
end
