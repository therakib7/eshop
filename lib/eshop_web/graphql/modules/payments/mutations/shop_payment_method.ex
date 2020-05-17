defmodule EshopWeb.Schema.Mutations.ShopPaymentMethod do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.ShopPaymentMethod, as: ShopPaymentMethod

  object :shop_payment_method_mutations do
    @desc "Create a shop_payment_method"
    field :create_shop_payment_method, type: :shop_payment_method do
      arg(:id, :integer)
      arg(:ac_holder_name, :string)
      arg(:ac_no, :integer)
      arg(:account_type, :string)
      arg(:is_active, :boolean)
      arg(:shop_id, :id)
      arg(:shop_payment_method_id, :id)
      arg(:user_id, :id)

      resolve(&ShopPaymentMethod.create_shop_payment_method/3)
    end

    @desc "Update a shop_payment_method"
    field :update_shop_payment_method, type: :shop_payment_method do
      arg(:id, non_null(:id))
      arg(:shop_payment_method_params, :shop_payment_method_params)

      resolve(&ShopPaymentMethod.update_shop_payment_method/2)
    end

    @desc "Delete a shop_payment_method"
    field :delete_shop_payment_method, type: :shop_payment_method do
      arg(:id, non_null(:id))
      resolve(&ShopPaymentMethod.delete_shop_payment_method/2)
    end
  end
end
