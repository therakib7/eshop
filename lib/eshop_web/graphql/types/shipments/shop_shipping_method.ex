defmodule EshopWeb.Schema.Types.ShopShippingMethod do
  use Absinthe.Schema.Notation

  @desc "A shop_shipping_method"
  object :shop_shipping_method do
    field :id, :integer
    field :shipping_method_id, :id
    field :shop_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A shop_shipping_method update"
  input_object :shop_shipping_method_params do 
    field :shipping_method_id, :id
    field :shop_id, :id
  end
end