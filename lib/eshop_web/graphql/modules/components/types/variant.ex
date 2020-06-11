defmodule EshopWeb.Schema.Types.Variant do
  use Absinthe.Schema.Notation

  @desc "A variant"
  object :variant do
    field :id, :integer
    field :order, :integer
    field :name, :string
    field :native_name, :string
    field :type, :integer
    field :shop_id, :integer
    field :user_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A variant update"
  input_object :variant_params do
    field :order, :integer
    field :name, :string
    field :native_name, :string
    field :type, :integer
    field :shop_id, :integer
    field :user_id, :integer
  end
end
