defmodule EshopWeb.Schema.Types.ShopShippingMethod do
  use Absinthe.Schema.Notation
  
  object "shop_shipping_method" do
    field :id, :integer
    field :shipping_method_id, :id
    field :shop_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
