defmodule EshopWeb.Schema.Mutations.ShopShippingMethod do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.ShopShippingMethod, as: ShopShippingMethod

  object :shop_shipping_method_mutations do
    @desc "Create a shop_shipping_method"
    field :create_shop_shipping_method, type: :shop_shipping_method do
      arg(:id, :integer)
      arg(:shop_shipping_method_id, :id)
      arg(:shop_id, :id)

      resolve(&ShopShippingMethod.create_shop_shipping_method/3)
    end

    @desc "Update a shop_shipping_method"
    field :update_shop_shipping_method, type: :shop_shipping_method do
      arg(:id, non_null(:id))
      arg(:shop_shipping_method_params, :shop_shipping_method_params)

      resolve(&ShopShippingMethod.update_shop_shipping_method/2)
    end

    @desc "Delete a shop_shipping_method"
    field :delete_shop_shipping_method, type: :shop_shipping_method do
      arg(:id, non_null(:id))
      resolve(&ShopShippingMethod.delete_shop_shipping_method/2)
    end
  end
end
