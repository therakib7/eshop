defmodule EshopWeb.Schema.Mutations.ShippingMethod do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.ShippingMethod, as: ShippingMethod

  object :shipping_method_mutations do
    @desc "Create a shipping_method"
    field :create_shipping_method, type: :shipping_method do
      arg(:id, :integer)
      arg(:is_active, :boolean)
      arg(:name, :string)
      arg(:native_name, :string)
      arg(:user_id, :integer)
      arg(:location_id, :integer)

      resolve(&ShippingMethod.create_shipping_method/3)
    end

    @desc "Update a shipping_method"
    field :update_shipping_method, type: :shipping_method do
      arg(:id, non_null(:id))
      arg(:shipping_method_params, :shipping_method_params)

      resolve(&ShippingMethod.update_shipping_method/2)
    end

    @desc "Delete a shipping_method"
    field :delete_shipping_method, type: :shipping_method do
      arg(:id, non_null(:id))
      resolve(&ShippingMethod.delete_shipping_method/2)
    end
  end
end
