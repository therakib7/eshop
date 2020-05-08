defmodule EshopWeb.Schema.Queries.ShippingAddress do 
  use Absinthe.Schema.Notation

  object :shipping_address_queries do
    @desc "Get all shipping_addresses"
    field :shipping_addresses, list_of(:shipping_address) do
      resolve &EshopWeb.Schema.Resolvers.ShippingAddress.list_shipping_addresses/3
    end
  end 
end
