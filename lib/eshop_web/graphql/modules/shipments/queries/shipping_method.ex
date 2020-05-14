defmodule EshopWeb.Schema.Queries.ShippingMethod do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.ShippingMethod, as: ShippingMethod

  object :shipping_method_queries do
    @desc "Get all shipping_methods"
    field :shipping_methods, list_of(:shipping_method) do
      resolve &ShippingMethod.list_shipping_methods/3
    end

    @desc "Get a shipping_method by its id"
    field :shipping_method, :shipping_method do
      arg :id, non_null(:id)
      resolve &ShippingMethod.get_shipping_method/3
    end 
  end
end