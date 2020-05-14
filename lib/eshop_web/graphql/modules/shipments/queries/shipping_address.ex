defmodule EshopWeb.Schema.Queries.ShippingAddress do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.ShippingAddress, as: ShippingAddress

  object :shipping_address_queries do
    @desc "Get all shipping_addresses"
    field :shipping_addresses, list_of(:shipping_address) do
      resolve &ShippingAddress.list_shipping_addresses/3
    end

    @desc "Get a shipping_address by its id"
    field :shipping_address, :shipping_address do
      arg :id, non_null(:id)
      resolve &ShippingAddress.get_shipping_address/3
    end 
  end
end