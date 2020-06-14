defmodule EshopWeb.Schema.Types.ShippingMethod do
  use Absinthe.Schema.Notation

  @desc "A shipping_method"
  object :shipping_method do
    field :id, :integer
    field :is_active, :boolean
    field :name, :string
    field :native_name, :string
    field :user_id, :integer
    field :location_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A shipping_method update"
  input_object :shipping_method_params do
    field :is_active, :boolean
    field :name, :string
    field :native_name, :string
    field :user_id, :integer
    field :location_id, :integer
  end
end
