defmodule EshopWeb.Schema.Queries.DiscountCode do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.DiscountCode, as: DiscountCode

  object :discount_code_queries do
    @desc "Get all discount_codes"
    field :discount_codes, list_of(:discount_code) do
      resolve(&DiscountCode.list_discount_codes/3)
    end

    @desc "Get a discount_code by its id"
    field :discount_code, :discount_code do
      arg(:id, non_null(:id))
      resolve(&DiscountCode.get_discount_code/3)
    end
  end
end
