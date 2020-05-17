defmodule EshopWeb.Schema.Mutations.ShippingAddress do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.ShippingAddress, as: ShippingAddress

  object :shipping_address_mutations do
    @desc "Create a shipping_address"
    field :create_shipping_address, type: :shipping_address do
      arg(:id, :integer)
      arg(:address, :string)
      arg(:lat, :float)
      arg(:long, :float)
      arg(:invoice_id, :id)
      arg(:location_id, :id)

      resolve(&ShippingAddress.create_shipping_address/3)
    end

    @desc "Update a shipping_address"
    field :update_shipping_address, type: :shipping_address do
      arg(:id, non_null(:id))
      arg(:shipping_address_params, :shipping_address_params)

      resolve(&ShippingAddress.update_shipping_address/2)
    end

    @desc "Delete a shipping_address"
    field :delete_shipping_address, type: :shipping_address do
      arg(:id, non_null(:id))
      resolve(&ShippingAddress.delete_shipping_address/2)
    end
  end
end
